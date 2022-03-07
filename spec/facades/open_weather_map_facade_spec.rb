require 'rails_helper'

RSpec.describe 'Open Weather Map Facade' do
  context 'successful query' do
    describe 'get_forecast', :vcr do
      let!(:lat) { 39.738453 }
      let!(:lon) { -104.984853 }
      let!(:forecast) { OpenWeatherMapFacade.get_forecast(lat, lon) }

      it "returns a forecast object" do
        expect(forecast).to be_a(Forecast)
      end

      it "returns a forecast object with the correct current weather object and data" do
        current = forecast.current_weather
        expect(current).to be_a(CurrentWeather)
        expect(current.datetime).to be_a(DateTime)
        expect(current.sunrise).to be_a(DateTime)
        expect(current.sunset).to be_a(DateTime)
        expect(current.temperature).to be_a(Float)
        expect(current.feels_like).to be_a(Float)
        expect(current.humidity).to be_a(Float || Integer)
        expect(current.uvi).to be_a(Float || Integer)
        expect(current.visibility).to be_a(Float || Integer)
        expect(current.conditions).to be_a(String)
        expect(current.icon).to be_a(String)
      end

      it "returns a forecast object with the correct daily weather array, objects and data" do
        daily_array = forecast.daily_weather
        expect(daily_array).to be_a(Array)
        expect(daily_array.count).to eq(5)
        daily = daily_array.sample(1)[0]
        expect(daily).to be_a(DailyWeather)
        expect(daily.date).to be_a(Date)
        expect(daily.sunrise).to be_a(DateTime)
        expect(daily.sunset).to be_a(DateTime)
        expect(daily.max_temp).to be_a(Float || Integer)
        expect(daily.min_temp).to be_a(Float || Integer)
        expect(daily.conditions).to be_a(String)
        expect(daily.icon).to be_a(String)
      end

      it "returns a forecast object with the correct hourly weather array, objects and data" do
        hourly_array = forecast.hourly_weather
        expect(hourly_array).to be_a(Array)
        expect(hourly_array.count).to eq(8)
        hourly = hourly_array.sample(1)[0]
        expect(hourly).to be_a(HourlyWeather)
        expect(hourly.time).to be_a(Time)
        expect(hourly.temperature).to be_a(Float || Integer)
        expect(hourly.conditions).to be_a(String)
        expect(hourly.icon).to be_a(String)
      end
    end
  end
end
