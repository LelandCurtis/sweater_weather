require 'rails_helper'

RSpec.describe 'Forecast object' do
  let!(:current) { CurrentWeather.new({dt: 1646612833,
                                      sunrise: 1646573135,
                                      sunset:  1646614624,
                                      temperature: 85.6,
                                      feels_like: 95.6,
                                      humidity: 84,
                                      uvi: 0.12,
                                      visibility: 432,
                                      conditions: "overcast clouds",
                                      icon: "04d"}) }
  let!(:daily) { DailyWeather.new({dt: 1646612833,
                                  sunrise: 1646573135,
                                  sunset:  1646614624,
                                  max_temp: 85.6,
                                  min_temp: 45.6,
                                  conditions: "overcast clouds",
                                  icon: "04d"}) }
  let!(:hourly) { HourlyWeather.new({dt: 1646612833,
                                    temperature: 85.6,
                                    conditions: "overcast clouds",
                                    icon: "04d"}) }

  let!(:forecast) { Forecast.new(current, [].fill(daily, 0, 5), [].fill(hourly, 0, 8)) }

  it "exists" do
    expect(forecast).to be_a(Forecast)
  end

  it "returns a forecast object with the correct current weather object and data" do
    current_weather = forecast.current
    expect(current_weather).to be_a(CurrentWeather)
    expect(current_weather.datetime.to_datetime.utc).to eq('2022-03-06 17:27:13 -07:00')
    expect(current_weather.sunrise.to_datetime.utc).to eq('2022-03-06 06:25:35 -07:00')
    expect(current_weather.sunset.to_datetime.utc).to eq('2022-03-06 17:57:04 -07:00')
    expect(current_weather.temperature).to eq(85.6)
    expect(current_weather.feels_like).to eq(95.6)
    expect(current_weather.humidity).to eq(84)
    expect(current_weather.uvi).to eq(0.12)
    expect(current_weather.visibility).to eq(432)
    expect(current_weather.conditions).to eq("overcast clouds")
    expect(current_weather.icon).to eq("04d")
  end

  it "returns a forecast object with the correct daily weather array, objects and data" do
    daily_array = forecast.daily
    expect(daily_array).to be_a(Array)
    expect(daily_array.count).to eq(5)
    daily_weather = daily_array.sample(1)[0]
    expect(daily_weather).to be_a(DailyWeather)
    expect(daily_weather.date).to eq('2022-03-06')
    expect(daily_weather.sunrise).to eq('2022-03-06 06:25:35 -07:00')
    expect(daily_weather.sunset).to eq('2022-03-06 17:57:04 -07:00')
    expect(daily_weather.max_temp).to eq(85.6)
    expect(daily_weather.min_temp).to eq(45.6)
    expect(daily_weather.conditions).to eq("overcast clouds")
    expect(daily_weather.icon).to eq("04d")
  end

  it "returns a forecast object with the correct hourly weather array, objects and data" do
    hourly_array = forecast.hourly
    expect(hourly_array).to be_a(Array)
    expect(hourly_array.count).to eq(8)
    hourly_weather = hourly_array.sample(1)[0]
    expect(hourly_weather).to be_a(HourlyWeather)
    expect(hourly_weather.time).to eq('17:27:13')
    expect(hourly_weather.temperature).to eq(85.6)
    expect(hourly_weather.conditions).to eq("overcast clouds")
    expect(hourly_weather.icon).to eq("04d")
  end
end
