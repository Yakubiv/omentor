10.times do
  user = User.create(email: Faker::Internet.email, password: 'password', sign_up_as: 1, terms_and_conditions: true)
  TutorProfile.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.last_name,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.cell_phone,
    dial_code: Faker::PhoneNumber.area_code,
    city: Faker::Nation.capital_city,
    country: Faker::Nation.language,
    gender: Profile.genders[:male],
    status: Profile.statuses[:active],
    degree_type: Profile.degree_types[:schoole],
    rate: rand(300..600),
    total_years_of_expirience: rand(3..10),
    stars: rand(1..5),
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    type: 'TutorProfile',
    user_id: user.id
  )
end

%w[student tutor].each do |r|
  u = User.create(email: "#{r}@gmail.com", password: 'password', sign_up_as: r, terms_and_conditions: true)
  Profile.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.last_name,
    birthday: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: Faker::PhoneNumber.cell_phone,
    dial_code: Faker::PhoneNumber.area_code,
    city: Faker::Nation.capital_city,
    country: Faker::Nation.language,
    gender: Profile.genders[:male],
    status: Profile.statuses[:active],
    degree_type: Profile.degree_types[:schoole],
    rate: rand(300..600),
    total_years_of_expirience: rand(3..10),
    stars: rand(1..5),
    bio: Faker::Lorem.paragraph(sentence_count: 2),
    type: "#{r.titleize}Profile",
    user_id: u.id
  )
end

%w[Фізика Математика АнглМова УкрМова].each do |s|
  Subject.create(name: s)
end