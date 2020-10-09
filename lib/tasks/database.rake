require 'csv'

namespace :database do
  task import_country: :environment do
    csv_text = File.read(Rails.root.join('lib', 'assets', 'country.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      Country.create(code: row['id'], locale: row['id'].downcase)
    end
  end

  task import_subjects: :environment do
    csv_text = File.read(Rails.root.join('lib', 'assets', 'subjects.csv'))
    csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
    csv.each do |row|
      Subject.create(name: row['Name'], status: 'active')
    end
  end

  task create_languages: :environment do
    csv = CSV.foreach(Rails.root.join('lib', 'assets', 'language.csv'), :headers=>true)

    csv.each do |row|
      country = Country.find_by(locale: row['639-1 '].strip)
      puts "created #{country&.locale}" if country
      puts "no created #{row}" unless country
      Language.create(name: row['Language name '].strip, country_id: country.id) if country
    end
  end
end