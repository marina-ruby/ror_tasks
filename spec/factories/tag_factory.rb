FactoryBot.define do
  factory :tag, class: Tag do
    name { Faker::Lorem.word }
  end
end
