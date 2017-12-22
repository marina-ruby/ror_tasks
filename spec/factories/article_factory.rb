FactoryBot.define do
  factory :article, class: Article do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraphs(3) }

    factory :article_with_comment do

      after(:create) do |article|
        create_list(:comment, rand(0..10), article: article)
        article.tags << Tag.order("RANDOM()").limit(3)
      end
    end
  end
end
