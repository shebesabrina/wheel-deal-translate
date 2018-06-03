require 'rails_helper'

describe 'Admin accessory pages' do
  it 'allows admin see all accessories' do
    admin = create(:user, role: 1)
    accessory = create(:accessory)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit '/admin/dashboard'

    click_on 'Accessories'

    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content(accessory.title)
    # expect(page).to have_content(accessory.thumbnail)
    expect(page).to have_content(accessory.description)
    expect(page).to have_content(accessory.role)
    expect(page).to have_button("Edit")
    expect(page).to have_button("Status")
  end

  it 'allows admin to edit an accessory' do
    admin = create(:user, role: 1)
    accessory = create(:accessory)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    within first("div.accessories") do
      click_on "Edit"
    end

    expect(current_path).to eq(edit_admin_accessory(accessory))
  end
end
