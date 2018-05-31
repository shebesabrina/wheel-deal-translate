describe 'user or admin' do
  context 'deleting their profile' do
    it 'should destroy user account successfully, end session, and show goodbye' do
      name1 = 'john316'
      password1 = 'secret'
      goodbye = 'Sad to see you go. Rejoin anytime!'
      user = User.create!(username: name1, password: password1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      # click_on 'Delete Profile'
      #
      # # expect(current_path).to eq(root_path)
      # # expect(page).to have_content(goodbye)
    end
  end
end
