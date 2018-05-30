require 'rails_helper'

describe 'Unregistered user index page' do
  describe 'allows user to add items to cart' do
    it 'displays login when user checks out' do
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
    end
  end
end
