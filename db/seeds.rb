# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

admin = User.create!(username: 'Pizza Cat', password: 'password', role: 1)
user1 = User.create!(username: 'Jerrel', password: 'password')
user2 = User.create!(username: 'PettyPal', password: 'password')


STATION_NAMES = ["Blake", "Market", "City Park", "Lucinda", "Shields", "College", "Oak", "Old Town", "Mulberry", "Silver Glenn", "Corron"]
CITY = ["Fort Collins", "Denver", "Aurora", "Aspen", "Loveland", "Westminster", "Colorado Springs", "Golden", "Lakewood", "Arvada"]

STATION_NAMES.map do |name|
  Station.create!(name: name, city: CITY.sample, dock_count: rand(0..12),
  installation_date: '7/18/2015')
end

SUB = ["Subscriber", "Customer"]
STARTDATE = ["2/24/2011 11:21", "2/30/2013 11:14", "3/12/2013 14:13"]
ENDDATE = ["8/29/2013 14:13", "8/30/2013 11:14",  "3/13/2013 11:14"]

65.times do
  Trip.create(duration: rand(1..100), start_date: STARTDATE.sample, start_station_id: rand(1..11), end_date: ENDDATE.sample, end_station_id: rand(1..11), bike_id: rand(1..100), subscription_type: SUB.sample, zip_code: rand(11111..99999))
end

26.times do
  accessory = Accessory.create(title: 'Pizza Cat', description: 'Delicious!', thumbnail: 'bike_horse.jpg', price: 10 )
end
