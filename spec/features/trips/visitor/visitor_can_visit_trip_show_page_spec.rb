require 'rails_helper'

describe 'opens a trip show page' do
  context 'as visitor' do
    it 'allows me to see all details about the trip' do
      trip = Trip.create!(duration: 63,
                          start_date: '8/29/2013 14:13',
                          end_date: '8/29/2013 14:14',
                          start_station: 66,
                          end_station: 66,
                          bike_id: 520,
                          subscription_type: 'Subscriber',
                          zip_code: 94127)

      visit trip_path(trip)

      expect(page).to have_content(trip.duration)
      expect(page).to have_content(trip.start_date)
      expect(page).to have_content(trip.end_date)
      expect(page).to have_content(trip.start_station)
      expect(page).to have_content(trip.end_station)
      expect(page).to have_content(trip.bike_id)
      expect(page).to have_content(trip.subscription_type)
      expect(page).to have_content(trip.zip_code)
    end
  end
end
