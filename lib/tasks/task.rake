require "csv"

task :update_data do
  Rake::Task['db:reset'].invoke
end

task export_users_emails: :environment do
  CSV.open("db/importers/file.csv", "wb") do |csv|
    csv << Author.attribute_names
    Author.all.each do |author|
      csv << author.attributes.values
    end
  end
end

task report_to_html: :environment do
  filename = "report_#{Time.now.to_i}"
  File.open("db/importers/reports/#{filename}.html",'w') do |report|
    count_authors = Author.count
    count_articles = Article.count
    count_comments = Comment.count
    most_comments_id = Comment.group(:article_id).count.max_by { |k, v| v }.try { |k, v| k }
    article = Article.find(most_comments_id)
    values = Comment.group(:article_id).count.values
    average_comments = values.reduce(:+) / values.size

    report.puts "Count of authors: #{count_authors} <br>"
    report.puts "Count of articles: #{count_articles} <br>"
    report.puts "Count of comments: #{count_comments} <br>"
    report.puts "Article with the most count of comments:
                 <a href='#{article}'> #{article.title} </a><br>"
    report.puts "Average count of comments: #{average_comments} <br>"
    report.puts "Table of tags <br>"

    Tag.all.each do |tag|
      report.puts "#{tag.name} - #{tag.articles.count} <br>"
    end

  end
end

task remove_old_tasks: :environment do
  Author.all.each do |author|
    ids_articles = author.articles.order("created_at DESC").offset(5).ids.sort
    Article.delete(ids_articles)
  end
end
