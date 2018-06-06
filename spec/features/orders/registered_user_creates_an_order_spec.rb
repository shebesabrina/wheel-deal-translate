require 'rails_helper'

describe 'registered user index page' do
   before(:each) do
      user = User.create(username: "penelop", password: "boom", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
   end
  describe 'user adds item to cart' do
    describe 'user clicks on check out' do
        it 'creates an order' do
        accessory = create(:accessory)
        visit accessory_path(accessory)
        4.times do
          click_on "Add to Cart"
        end
        visit cart_path

        click_on 'Check Out'

        expect(page).to have_content(accessory.quantity)
      end
    end
  end
end