FactoryBot.define do
  factory :reminder do
    description { 'MyString' }
    datetime { Faker::Time.forward(days: 364) }
    city { Faker::Address.city }
    location_coordinates { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
  end
end
