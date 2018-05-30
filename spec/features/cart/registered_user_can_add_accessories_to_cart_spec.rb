require 'rails_helper'

describe 'Unregistered user index page' do
  describe 'allows user to add items to cart' do
    it 'displays contents in cart' do
      accessory = create(:accessory)

      visit accessory_path(accessory)

      click_on "Add to Cart"

      visit cart_path
# save_and_open_page
      expect(current_path).to eq(cart_path)
      expect(page).to have_content(accessory.title)
      expect(page).to have_content(accessory.price)
      # expect(page).to have_content(accessory.thumbnail)
      expect(Accessory.all.count).to eq(1)
      expect(page).to have_button("Remove")
      expect(page).to have_button("Check Out")
    end
  end
end

describe 'Cart index page' do
  it 'allows user to delete accessory' do
    accessory = create(:accessory)

    visit accessory_path(accessory)

    click_on "Add to Cart"

    visit cart_path

    click_on 'Remove'

    expect(page).to have_content("Successfully removed #{accessory.title}from your cart.")
    expect(Accessory.all.count).to eq(0)
  end
end

describe 'Cart index page' do
  it 'allows registered user to check out' do
    accessory = create(:accessory)

    visit accessory_path(accessory)

    click_on "Add to Cart"

    visit cart_path

    click_on 'Check Out'

    expect(page).to have_content("Successfully submitted your order totaling #{accessory.price}")
  end
end
