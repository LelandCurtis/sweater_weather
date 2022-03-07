require 'rails_helper'

RSpec.describe 'DailyWeather object' do
  let!(:attributes) { {dt: 1646612833,
                      sunrise: 1646573135,
                      sunset:  1646614624,
                      max_temp: 85.6,
                      min_temp: 45.6,
                      conditions: "overcast clouds",
                      icon: "04d"}
                    }
  let!(:daily_weather) { DailyWeather.new(attributes) }

  it "exists" do
    expect(daily_weather).to be_a(DailyWeather)
  end

  it "has correct attributes" do
    expect(daily_weather.date).to eq('2022-03-06')
    expect(daily_weather.sunrise).to eq('2022-03-06 06:25:35 -07:00')
    expect(daily_weather.sunset).to eq('2022-03-06 17:57:04 -07:00')
    expect(daily_weather.max_temp).to eq("85.6 F")
    expect(daily_weather.min_temp).to eq("45.6 F")
    expect(daily_weather.conditions).to eq("overcast clouds")
    expect(daily_weather.icon).to eq("04d")
  end
end
