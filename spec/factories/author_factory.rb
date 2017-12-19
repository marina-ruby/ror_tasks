FactoryBot.define do
  factory :author, class: Author do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    date_of_birth { Faker::Date.birthday(18, 85) }
  end
end
