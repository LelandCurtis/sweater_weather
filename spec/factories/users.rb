FactoryBot.define do
  factory :user do
    email { "#{Faker::Name.first_name}_#{Faker::Name.last_name}@email.com" }
    password_digest { "MyString" }
  end
end
