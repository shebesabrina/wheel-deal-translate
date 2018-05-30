require 'rails_helper'

describe 'Unregistered user index page' do
  describe 'allows user to add items to cart' do
    it 'displays login when user checks out' do
      accessory = create(:accessory)

      visit accessory_path(accessory)

      click_on "Add to Cart"

      visit cart_path

      click_on "Register"

      expect(current_path).to eq('/users/new')

      fill_in :username, with: 'John'
      fill_in :password, with: 'password'

      expect(current_path).to eq(cart_path)
      expect(page).to have_content(accessory.thumbnail)
      expect(page).to have_content(accessory.title)
      expect(page).to have_content(accessory.description)
      expect(page).to have_content(accessory.price)
      expect(cart.total_count).to eq(10)
      expect(page).to have_content("Remove")
    end
  end
end
