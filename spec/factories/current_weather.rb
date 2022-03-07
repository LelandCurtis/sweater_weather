FactoryBot.define do
  factory :current_weather do
    
    datetime { Faker::Number.number(digits: 10) }
    sunrise { Faker::Number.number(digits: 10) }
    sunset { sunrise + 41400 }
    temperature { Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    feels_like { Faker::Number.decimal(l_digits: 2, r_digits: 1)}
    humidity { Faker::Number.between(from: 0, to: 100) }
    uvi { Faker::Number.between(from: 0.00, to: 1.00) }
    visibility { Faker::Number.between(from: 10, to: 1000) }
    conditions { "overcast clouds" }
    icon { "04d" }

    intiailize_with { new(attributes) }
  end
end
