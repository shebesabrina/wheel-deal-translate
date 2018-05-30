require 'rails_helper'

describe 'admin' do
  context 'admin station new page' do
    it 'should be able to fill in all station attributes' do

      station = Station.create(name: 'LaFox', dock_count: 5, city: "Fort Collins")
      date = Date.strptime("6/15/2012", '%m/%d/%Y')
      visit new_station_path

      fill_in 'station[name]', with: 'LaFox'
      fill_in 'station[dock_count]', with: '11'
      fill_in 'station[city]', with: 'Campton Hills'
      fill_in 'station[installation_date]', with: date

      click_on 'Create Station'

      expect(current_path).to eq("/station/#{station.name}")
    end
  end
end