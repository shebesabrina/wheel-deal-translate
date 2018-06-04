# require 'rails_helper'
#
# describe 'Admin accessory pages' do
#   it 'allows admin see all accessories' do
#     admin = create(:user, role: 1)
#     accessory = create(:accessory)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
#
#
#     within first("div.accessories") do
#       click_on "Status"
#     end
#   end
# end
