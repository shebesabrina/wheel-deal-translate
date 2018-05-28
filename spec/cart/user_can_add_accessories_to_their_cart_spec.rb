require 'rails_helper'

describe 'Visitor index page' do
  it 'allows user to add an accessory to their cart' do

    accessory = create(:accessory, title: "Pizza Cat 13")

    visit '/bike-shop'

    within first("div.accessories") do
      click_on "Add to Cart"
    end

    expect(page).to have_content("Added 1 #{accessory.title} to your cart")
  end
end

describe 'Visitor index page' do
  it 'displays the the increment amount of accessories' do

    accessory = create(:accessory, title: "Pizza Cat 1", id: 1)

    visit '/bike-shop'

    within first("div.accessories") do
      click_on "Add to Cart"
    end

    expect(page).to have_content("Added 1 #{accessory.title} to your cart.")

    visit '/bike-shop'

    within(:xpath, '/html/body/div[1]') do
      click_on "Add to Cart"
    end

    # find('div.accessories:nth-child(2)').click_on "Add to Cart"
    # find("div.accessories", :title => "Pizza Cat 2").click_on "Add to Cart"
# save_and_open_page
    expect(page).to have_content("Added 2 #{accessory.title} to your cart.")
  end
end

describe 'Visitor index page' do
  xit 'displays number of accessories in the cart' do

    create(:accessory)

    visit '/bike-shop'

    expect(page).to have_content('Cart: 0')

      click_on "Add to Cart"

    expect(page).to have_content('Cart: 1')
  end
end
