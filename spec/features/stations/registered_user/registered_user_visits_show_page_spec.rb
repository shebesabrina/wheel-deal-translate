require 'rails_helper'

describe 'registered user' do
  context 'visits stations show page' do
    it 'should see current path as /:station-name' do
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins")

      visit "/#{station.name}"

      expect(current_path).to eq("/#{station.name}")
    end

    it 'should see a list of stations with all attributes' do

      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins")

      visit "/#{station.name}"

      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.created_at)
    end

    it 'should see the number of rides started at this station' do
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins")

      visit "/#{station.name}"

      expect(page).to have_content(station.started_at)
    end
  end
end