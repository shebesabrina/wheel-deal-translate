require 'rails_helper'

describe 'visitor' do
  context 'logging in' do
    xit 'should log in default user and bring to dashboard' do
      username = 'jerrel2'
      logged_in_message = "Welcome, #{username}!"
      user = User.create!(username: username, password: 'secret')

      visit root_path

      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: user.password
      click_button 'Log In'

      expect(current_path).to eq(user_dashboard_path(user))
      expect(page).to have_content(logged_in_message)
      expect(page).to have_link('Log Out')
    end
    xit 'can log out of account after signing in' do
      name1 = 'john316'
      password1 = 'secret'
      user = User.create!(username: name1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_link 'Log Out'

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end
  end

  context 'fills out registration form' do
    xit 'should make a user account successfully and redirect to user page' do
      username = 'sabrina1'

      visit root_path

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_usernamename, with: username
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content(username)
    end

    xit 'should not allow duplicate usernames' do
      error = 'That username is already taken! Please try a different username.'
      username = 'john316'
      User.create!(username: username, password: 'secret')

      visit new_user_path

      fill_in :user_username, with: username
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(page).to have_content(error)
      expect(page).to have_content('Create an Account')
    end
  end
end
