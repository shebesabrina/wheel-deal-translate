# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'simplecov'
SimpleCov.start
# Add additional requires below this line. Rails is not loaded until this point!

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:each) do
    DatabaseCleaner.clean
  end

  c.after(:each) do
    DatabaseCleaner.clean
  end
  c.include Capybara::DSL
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

require 'rails_helper'

describe 'visitor' do
  context 'logging in' do
    it 'should log in default user and bring them to their ideas page' do
      name = 'wow'
      email = 'wow@gmail.com'
      password = 'secret'
      user = User.create!(name: name, email: email, password: password)

      visit '/'
      click_on 'Log In'

      expect(current_path).to eq(login_path)

      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Log In'

      expect(current_path).to eq(user_ideas_path(user))
      expect(page).to have_link('Log Out')
    end
  end

  context 'fills out registration form' do
    it 'should make a default user account successfully' do
      name = 'wow'
      email = 'wow@gmail.com'

      visit '/'

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(current_path).to eq(user_path(User.last))
      expect(page).to have_content(name)
    end

    it 'can log out of account after signing in' do
      name1 = 'blipper'
      email1 = 'yeahway@wow.com'
      password1 = 'secret'
      user = User.create!(name: name1, email: email1, password: password1, role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_link 'Log Out'

      click_on 'Log Out'

      expect(current_path).to eq(root_path)
    end

    it 'should not allow duplicate user emails' do
      name = 'wow'
      email = 'wow@gmail.com'
      User.create!(name: name, email: email, password: 'secret')

      visit new_user_path

      fill_in :user_name, with: 'Bubs'
      fill_in :user_email, with: email
      fill_in :user_password, with: 'supersecret'

      click_on 'Create User'

      expect(current_path).to eq(users_path)
    end
  end
end
