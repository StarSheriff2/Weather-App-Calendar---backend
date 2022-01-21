# seed 50 records
50.times do
  reminder = Reminder.create(
    description: Faker::Lorem.characters(number: 30),
    datetime: Faker::Time.forward(days: 364),
    city: Faker::Address.city,
    location_coordinates: "#{Faker::Address.latitude}, #{Faker::Address.longitude}",
    created_by: User.first.id
  )
end
