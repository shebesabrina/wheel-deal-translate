FactoryBot.define do
  factory :accessory do
    sequence(:title) { |n| "Pizza Cat #{n}" }
    thumbnail 'bike_horse.jpg'
    description 'Fantastic!'
    price 10
  end
end
