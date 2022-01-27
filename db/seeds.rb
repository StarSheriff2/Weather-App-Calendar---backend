User.create(name: 'Test User', email: 'foo@bar.com', password: 'foobar44A33!')

class Address
  def initialize(address)
    @city = address.city
    @latitude = address.latitude
    @longitude = address.longitude
  end

  attr_reader :city, :latitude, :longitude
end

generate_address = -> { address = Faker::Address }

# seed 20 records
20.times do
  a = Address.new(generate_address.call)

  reminder = Reminder.create(
    description: Faker::Lorem.words(number: rand(2..3)).join(' '),
    datetime: Faker::Time.forward(days: 364),
    city: a.city,
    location_coordinates: "#{a.latitude}, #{a.longitude}",
    created_by: User.first.id
  )
end
