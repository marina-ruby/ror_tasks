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

task :report_to_html do
  count_authors = Author.count
  count_articles = Article.count
  count_comments = Comment.count
  most_comments_id = Comment.group(:article_id).count.max_by { |k, v| v }.try { |k, v| k }
  most_commetns = Article.find(most_comments_id)

  values = Comment.group(:article_id).count.values
  average_comments = values.resuse(:+) / values.size
end

task :remove_old_tasks do

end
