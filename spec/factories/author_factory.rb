FactoryBot.define do
  factory :author, class: Author do
    name { Faker::Name.name }
    password { Faker::Internet.password }
    email { Faker::Internet.email(name) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    date_of_birth { Faker::Date.birthday(18, 85) }

    factory :author_with_article do
      after(:create) do |author|
        create(:article, author: author)
      end
    end

    factory :author_with_articles do
      after(:create) do |author|
        create_list(:article_with_comments, 10, author: author)
      end
    end
  end
end
