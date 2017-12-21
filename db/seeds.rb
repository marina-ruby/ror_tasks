FactoryBot.create_list(:tag, 20)

20.times do
  author = FactoryBot.create(:author)
  10.times do
    article = author.articles.create(FactoryBot.attributes_for(:article))
    article.comments.create(FactoryBot.attributes_for_list(:comment, rand(0..10)))
    article.tags << Tag.order("RANDOM()").limit(3)
  end
end
