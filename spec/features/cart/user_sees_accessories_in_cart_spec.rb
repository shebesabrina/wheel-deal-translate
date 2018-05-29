require 'rails_helper'

describe 'User cart page' do
  xit 'should display the information and price total of items in cart' do
    accessory_1 = create(:accessory, price: 20)
    accessory_2 = create(:accessory, price: 10)
    user = create(:user)

    visit cart_path(user)

    expect(page).to have_content("Total: 30")
    expect(page).to have_content(accessory_1.title)
    expect(page).to have_content(accessory_1.price)
    expect(page).to have_content(accessory_1.thumbnail)
    expect(page).to have_content(accessory_2.title)
    expect(page).to have_content(accessory_2.price)
    expect(page).to have_content(accessory_2.thumbnail)
  end
end
