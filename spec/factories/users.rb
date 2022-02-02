FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { 'foo@bar.com' }
    password { 'foobar44A33!' }
  end
end
