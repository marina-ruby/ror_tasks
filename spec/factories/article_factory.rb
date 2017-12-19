FactoryBot.define do
  factory :article, class: Article do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraphs(3) }
  end
end
