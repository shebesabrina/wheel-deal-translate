describe 'Admin new accessory page' do
  xit 'Allows admin to create an accessory' do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_admin?).and_return(admin)

    accessory = create(:accessory, title: 'something new', thumbnail: 'basket.jpg')

    visit admin_bike_shop_accessory_new_path

    fill_in 'accessory[title]', with: accessory.title
    fill_in 'accessory[description]', with: accessory.description
    fill_in 'accessory[price]', with: accessory.price
    fill_in 'accessory[thumbnail]', with: accessory.thumbnail

    click_on 'Save Accessory'
# save_and_open_page
    expect(current_path).to eq('/admin/bike-shop')
    expect(page).to have_content(accessory.title)
    expect(page).to have_content(accessory.thumbnail)
    expect(page).to have_content(accessory.description)
    expect(page).to have_content(accessory.role)
    expect(page).to have_button("Edit")
    expect(page).to have_button("Status")
  end
end
