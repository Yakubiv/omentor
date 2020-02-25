require 'csv'

namespace :database do
  task import_country: :environment do
    csv_text = File.read(Rails.root.join('lib', 'assets', 'country.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      puts "#{row["id"]}: #{row["value"]}"
      # Country.create(code: row['id'], locale: row['id'].downcase)
    end
  end
end