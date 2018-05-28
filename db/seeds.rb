# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
admin = User.create!(username: 'Pizza Cat', password: 'password', role: 1)
user = User.create!(username: 'Jerrel', password: 'password')
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
85.times do
  Trip.create!(duration: 63, start_date: '8/29/2013 14:13', start_station: 66, end_date: '8/29/2013 14:14', end_station: 66, bike_id: 520, subscription_type: 'Subscriber', zip_code: 94127)
end
