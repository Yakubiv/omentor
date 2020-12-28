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

  factory :subject do
    name { Faker::Educator.subject }
  end

  factory :lesson do
    subject
    start_at { Faker::Time.forward(days: 23, period: :morning) }
    duration { 60 }
  end

  factory :class_room do
    tutor_profile
    student_profile
  end

  factory :profile do
    country
  end

  factory :student_profile do
    country
  end

  factory :tutor_profile do
    country
  end

  factory :favorite do
  end

  factory :messages do 
    tutor_profile
    student_profile
  end

  factory :sender do 
  end

end