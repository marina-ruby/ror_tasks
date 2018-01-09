FactoryBot.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.email(name) }
    password { Faker::Internet.password(6) }
  end
end
