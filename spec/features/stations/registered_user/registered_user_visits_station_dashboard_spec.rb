require 'rails_helper'

describe 'registered user' do
  context 'visits stations dashboard page /stations-dashboard' do
    it 'should show the total station count' do
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins")
      station2 = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins")
      Trip.create(duration: 63, start_date: '8/29/2013 14:13', start_station_id: station.id, end_date: '8/29/2013 14:14', end_station_id: 2, bike_id: 520, subscription_type: 'Subscriber', zip_code: 94127)
      Trip.create(duration: 63, start_date: '8/29/2013 14:13', start_station_id: station.id, end_date: '8/29/2013 14:14', end_station_id: 1, bike_id: 520, subscription_type: 'Subscriber', zip_code: 94127)

      visit "/stations-dashboard"
      expect(current_path).to eq("/stations-dashboard")

      expect(page).to have_content(Station.total_count)
    end