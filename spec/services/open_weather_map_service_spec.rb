require 'rails_helper'

RSpec.describe 'Open Weather Map Service' do
  context 'successful query' do
    describe 'get forecast' do
      let!(:lat) { 39.738453 }
      let!(:lon) { -104.984853 }
      let!(:response) { OpenWeatherMapService.get_forecast(lat, lon) }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns a successful https status", :vcr do
        expect(response.status).to eq(200)
      end

      it "returns the critical data in the data hash", :vcr do
        expect(json).to be_a(Hash)
        expect(json).to have_key(:daily)
        expect(json).to have_key(:hourly)
        expect(json).to have_key(:current)
        expect(json).to_not have_key(:minutely)
        expect(json).to_not have_key(:alerts)

        current = json[:current]
        expect(current).to be_a(Hash)
        current_weather_keys = [:dt,
                                :sunrise,
                                :sunset,
                                :temp,
                                :feels_like,
                                :humidity,
                                :uvi,
                                :visibility,
                                :weather]
        # check that all requried keys are in hash
        expect(current.keys & current_weather_keys ==  current_weather_keys).to eq(true)
        expect(current[:dt]).to be_a(Integer)
        expect(current[:sunrise]).to be_a(Integer)
        expect(current[:sunset]).to be_a(Integer)
        expect(current[:weather]).to be_a(Array)
        expect(current[:weather][0]).to be_a(Hash)
        expect(current[:weather][0]).to have_key(:description)
        expect(current[:weather][0]).to have_key(:icon)

        daily_array = json[:daily]
        expect(daily_array).to be_a(Array)
        daily = daily_array.sample(1)[0]
        expect(daily).to be_a(Hash)
        daily_weather_keys = [:dt,
                              :sunrise,
                              :sunset,
                              :temp,
                              :weather]
        # check that all requried keys are in hash
        expect(daily.keys & daily_weather_keys ==  daily_weather_keys).to eq(true)

        expect(daily[:dt]).to be_a(Integer)
        expect(daily[:sunrise]).to be_a(Integer)
        expect(daily[:sunset]).to be_a(Integer)
        expect(daily[:temp]).to be_a(Hash)
        expect(daily[:temp]).to have_key(:max)
        expect(daily[:temp]).to have_key(:min)

        expect(daily[:weather]).to be_a(Array)
        expect(daily[:weather][0]).to be_a(Hash)
        expect(daily[:weather][0]).to have_key(:description)
        expect(daily[:weather][0]).to have_key(:icon)

        hourly_array = json[:daily]
        expect(hourly_array).to be_a(Array)
        hourly = hourly_array.sample(1)[0]
        expect(hourly).to be_a(Hash)
        hourly_weather_keys = [:dt,
                              :temp,
                              :weather]
        # check that all requried keys are in hash
        expect(hourly.keys & hourly_weather_keys ==  hourly_weather_keys).to eq(true)
        expect(hourly[:dt]).to be_a(Integer)
        expect(hourly[:weather]).to be_a(Array)
        expect(hourly[:weather][0]).to be_a(Hash)
        expect(hourly[:weather][0]).to have_key(:description)
        expect(hourly[:weather][0]).to have_key(:icon)
      end
    end
  end
end
