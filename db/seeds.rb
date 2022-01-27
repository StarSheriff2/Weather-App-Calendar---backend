User.create(name: 'Test User', email: 'foo@bar.com', password: 'foobar44A33!')
# seed 20 records
20.times do
  reminder = Reminder.create(
    description: Faker::Lorem.words(number: rand(2..3)).join(' '),
    datetime: Faker::Time.forward(days: 364),
    city: Faker::Address.city,
    location_coordinates: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
    created_by: User.first.id
  )
end
