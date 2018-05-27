require 'rails_helper'

describe 'visitor' do
  context 'visits stations index page' do
    it 'should see current path as /:station-name' do
      t = Time.new(2007,11,19,8,37,48,"-06:00")
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins", installation_date: t.strftime("%m/%d/%Y"))

      visit "/#{station.name}"

      expect(current_path).to eq("/#{station.name}")
    end

    it 'should see a list of stations with all attributes' do
      t = Time.new(2007,11,19,8,37,48,"-06:00")
      station = Station.create(name: 'Fort', dock_count: 5, city: "Fort Collins", installation_date: t.strftime("%m/%d/%Y"))
      binding.pry
      visit "/#{station.name}"
      save_and_open_page
      expect(page).to have_content(station.name)
      expect(page).to have_content(station.dock_count)
      expect(page).to have_content(station.city)
      expect(page).to have_content(station.installation_date)
    end
  end
end