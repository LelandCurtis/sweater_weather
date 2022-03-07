require 'rails_helper'

RSpec.describe 'CurrentWeather object' do
  let!(:attributes) { {dt: 1646612833,
                      sunrise: 1646573135,
                      sunset:  1646614624,
                      temperature: 85.6,
                      feels_like: 95.6,
                      humidity: 84,
                      uvi: 0.12,
                      visibility: 432,
                      conditions: "overcast clouds",
                      icon: "04d"}
                    }
  let!(:current_weather) { CurrentWeather.new(attributes) }

  it "exists" do
    expect(current_weather).to be_a(CurrentWeather)
  end

  it "has correct attributes" do
    expect(current_weather.datetime).to eq('2022-03-06 17:27:13 -07:00')
    expect(current_weather.sunrise).to eq('2022-03-06 06:25:35 -07:00')
    expect(current_weather.sunset).to eq('2022-03-06 17:57:04 -07:00')
    expect(current_weather.temperature).to eq("85.6 F")
    expect(current_weather.feels_like).to eq("95.6 F")
    expect(current_weather.humidity).to eq(84)
    expect(current_weather.uvi).to eq(0.12)
    expect(current_weather.visibility).to eq(432)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end
end
