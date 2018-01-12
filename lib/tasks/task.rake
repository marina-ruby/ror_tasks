require 'csv'

class ReportExporter
  include Rails.application.routes.url_helpers

  def calc_values
    @count_authors = Author.count
    @count_articles = Article.count
    @count_comments = Comment.count
    most_comments_id = Comment.group(:article_id)
                              .count.max_by { |_k, v| v }.try { |k, _v| k }
    @article = Article.find(most_comments_id)
    values = Comment.group(:article_id).count.values
    @average_comments = values.reduce(:+) / values.size
  end

  def complete_report
    calc_values
    filename = "report_#{Time.now.to_i}"
    File.open("db/importers/reports/#{filename}.html", 'w') do |report|
      report.puts "Count of authors: #{@count_authors} <br>"
      report.puts "Count of articles: #{@count_articles} <br>"
      report.puts "Count of comments: #{@count_comments} <br>"
      report.puts "Article with the most count of comments:
                  <a href='#{article_path(@article.id)}'>
                     #{@article.title} </a><br>"
      report.puts "Average count of comments: #{@average_comments} <br>"
      report.puts 'Table of tags <br>'

      Tag.all.each do |tag|
        report.puts "#{tag.name} - #{tag.articles.count} <br>"
      end
    end
  end
end

task :update_data do
  Rake::Task['db:reset'].invoke
end

task export_users_emails: :environment do
  CSV.open('db/importers/users_info.csv', 'wb') do |csv|
    csv << Author.attribute_names
    Author.find_each do |author|
      csv << author.attributes.values
    end
  end
end

task report_to_html: :environment do
  reporter = ReportExporter.new
  reporter.complete_report
end

task remove_old_tasks: :environment do
  Author.find_each do |author|
    ids_articles = author.articles.order('created_at DESC').offset(5).ids.sort
    ids_articles.each do |id_art|
      author.articles.delete(id_art)
    end
  end
end
