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
    Country.find_each do |country|
      Language.create(country_id: country.id, name: I18n.t("countries.#{country.code}"))
    end
  end
end