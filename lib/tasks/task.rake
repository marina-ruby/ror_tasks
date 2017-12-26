task :update_data do
  Rake::Task['db:reset'].invoke
end

require "csv"

task export_users_emails: :environment do
  CSV.open("app/assets/file.csv", "wb") do |csv|
    csv << Author.attribute_names
    Author.all.each do |author|
      csv << author.attributes.values
    end
  end
end

task :report_to_html do

end

task :remove_old_tasks do

end
