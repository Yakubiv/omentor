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
end