require 'rails_helper'

describe 'visitor' do
  context 'visits stations index page' do
    it 'should see current path as /:station-name' do
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins", installation_date: "01/18/2015")

      visit "/#{station.name}"

      expect(current_path).to eq("/#{station.name}")
    end

    it 'should see a list of stations with all attributes' do

      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins", installation_date: "01/18/2015")

      visit "/#{station.name}"
      save_and_open_page
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)
    end
  end
end