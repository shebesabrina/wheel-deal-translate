FactoryBot.define do
  factory :accessory do
    sequence(:title) { |n| "Pizza Cat #{n}" }
    thumbnail 'https://i.pinimg.com/originals/67/1c/75/671c759ef0053fb44669d82ae5e354f4.jpg'
    description 'Fantastic!'
    price 10
  end
end
