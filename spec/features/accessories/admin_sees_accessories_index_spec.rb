require 'rails_helper'

describe 'User visits accessories index page' do
  context 'as admin' do
    it 'allows admin to see all accessories' do
	    admin = User.create(username: 'penelope',
                          password: 'boom',
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_accessories_path

      expect(page).to have_content('Admin Accessories')
    end
  end
end
