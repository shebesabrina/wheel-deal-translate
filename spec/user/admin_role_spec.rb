require 'rails_helper'

describe 'Admin role login' do
  it 'displays the admin dashboard page' do

    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_accessories_path

    expect(page).to have_content("Logged in as Admin User: #{admin.username}")
  end
end
