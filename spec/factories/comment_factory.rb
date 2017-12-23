FactoryBot.define do
  factory :comment, class: Comment do
    user_name { Faker::Name.name }
    text { Faker::Lorem.paragraphs(3) }
  end
end
