task :update_data do
  Rake::Task['db:reset'].invoke
end

require "csv"

task export_users_emails: :environment do
  CSV.open("db/importers/file.csv", "wb") do |csv|
    csv << Author.attribute_names
    Author.all.each do |author|
      csv << author.attributes.values
    end
  end
end

task :report_to_html do
  count_authors = Author.all.count
  count_articles = Article.all.count
  count_comments = Comment.all.count
  most_comments = Article.find_by()
end

task :remove_old_tasks do

end
