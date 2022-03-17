require 'rails_helper'

RSpec.describe 'HourlyWeather object' do
  let!(:attributes) { {dt: 1646612833,
                      temperature: 85.6,
                      conditions: "overcast clouds",
                      icon: "04d"}
                    }
  let!(:hourly_weather) { HourlyWeather.new(attributes) }

  it "exists" do
    expect(hourly_weather).to be_a(HourlyWeather)
  end

  it "has correct attributes" do
    expect(hourly_weather.time.to_datetime.utc).to eq('17:27:13')
    expect(hourly_weather.temperature).to eq(85.6)
    expect(hourly_weather.conditions).to eq("overcast clouds")
    expect(hourly_weather.icon).to eq("04d")
  end
end
