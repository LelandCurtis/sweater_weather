FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.first_name}_#{Faker::Name.last_name}@email.com" }
    password { "password" }
    password_confirmation { "password" }
    api_key { Faker::Alphanumeric.alphanumeric(number: 27) }
  end
end
