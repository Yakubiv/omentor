FactoryBot.define do
  factory :author, class: 'User' do
    email { Faker::Internet.email }
    password { 'password' }
    terms_and_conditions { true }
  end

  factory :blog_post do
    author
    title { Faker::Lorem.question }
    body { Faker::Lorem.sentence }
  end

  factory :country do
    sequence(:code) { |n| 'EN' + n.to_s }
    locale { 'en' }
  end

  factory :profile do
    country
  end

  factory :student_profile, parent: :profile do
  end

  factory :tutor_profile, parent: :profile do
  end

  factory :favorite do
  end
end