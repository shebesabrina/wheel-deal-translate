require 'rails_helper'

describe 'Visitor show page' do
  xit 'displays the information of one accessory' do
    accessory = create(:accessory)

    visit accessory_path(accessory)

    expect(page).to have_content(accessory.thumbnail)
    expect(page).to have_content(accessory.title)
    expect(page).to have_content(accessory.description)
    expect(page).to have_content(accessory.price)
  end
end
