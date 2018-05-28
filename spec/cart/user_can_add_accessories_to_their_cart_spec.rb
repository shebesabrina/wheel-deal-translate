require 'rails_helper'

describe 'Visitor index page' do
  it 'allows user to add an accessory to their cart' do

    accessory = create(:accessory)

    visit '/bike-shop'

    within first("div.accessories") do
      click_on "Add to Cart"
    end

    expect(page).to have_content("Added #{accessory.title} to your cart")
  end
end

describe 'Visitor index page' do
  it 'displays the the increment amount of accessories' do

    accessory_1 = create(:accessory, title: "Pizza Cat 1")

    visit '/bike-shop'

    within first("div.accessories") do
      click_on "Add to Cart"
    end

    expect(page).to have_content("Added 1 #{accessory_1.title} in your cart.")

    accessory_2 = create(:accessory, title: "Pizza Cat 2")

    visit '/bike-shop'

    within last("div.accessories") do
      click_on "Add to Cart"
    end

    expect(page).to have_content("Added 2 #{accessory_2.title} in your cart.")
  end
end
