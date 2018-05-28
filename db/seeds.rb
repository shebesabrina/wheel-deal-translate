# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
STATION_NAMES = ["Blake", "Market", "City Park", "Lucinda", "Shields", "College", "Oak", "Old Town", "Mulberry", "Silver Glenn", "Corron"]
CITY = ["Fort Collins", "Denver", "Aurora", "Aspen", "Loveland", "Westminster", "Colorado Springs", "Golden", "Lakewood", "Arvada"]

stations = STATION_NAMES.map do |name|
   Station.create!(name: name, city: CITY.sample, dock_count: rand(0..12), installation_date: '7/18/2015')
end


85.times do
  trip = Trip.create(duration: 63, start_date: '8/29/2013 14:13', start_station: rand(1..11), end_date: '8/29/2013 14:14', end_station: rand(1..11), bike_id: 520, subscription_type: 'Subscriber', zip_code: 94127)
end
