FactoryBot.define do
  factory :author, class: Author do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    date_of_birth { Faker::Date.birthday(18, 85) }

    factory :author_with_article do
      after(:create) do |author|
        create_list(:article_with_comment, 14, author: author)
      end
    end
  end
end
