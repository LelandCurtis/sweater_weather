require 'rails_helper'

RSpec.describe 'CurrentWeather object' do
  let!(:attributes) { {datetime: DateTime.new(2020, 9, 30, 13, 27, 03, Rational(-6, 24)),
                      sunrise: DateTime.new(2020, 9, 30, 6, 27, 03, Rational(-6, 24)),
                      sunset: DateTime.new(2020, 9, 30, 18, 27, 03, Rational(-6, 24)),
                      temperature: 85.6,
                      feels_like: 95.6,
                      humidity: 84,
                      uvi: 0.12,
                      visibility: 432,
                      conditions: "overcast clouds",
                      icon: "04d"}
                    }
  let!(:current_weather) { CurrentWeather.new(attributes) }
  #let!(:current_weather_factory) { build(:current_weather) }

  it "exists" do
    expect(current_weather).to be_a(CurrentWeather)
  end

  it "has correct attributes" do
    expect(current_weather.datetime).to eq('2020-09-30 13:27:03 -06:00')
    expect(current_weather.sunrise).to eq('2020-09-30 06:27:03 -06:00')
    expect(current_weather.sunset).to eq('2020-09-30 18:27:03 -06:00')
    expect(current_weather.temperature).to eq(85.6)
    expect(current_weather.feels_like).to eq(95.6)
    expect(current_weather.humidity).to eq(84)
    expect(current_weather.uvi).to eq(0.12)
    expect(current_weather.visibility).to eq(432)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
