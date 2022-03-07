require 'rails_helper'

RSpec.describe 'forcast endpoint GET /api/v1/forecast?location=city,state_abv' do
  context 'successful query' do
    describe 'get_forecast(city, state)' do
      let!(:query) { "?city=Denver&state=CO" }

      it "returns the forecast for the given city and state" do
        get "/api/v1/forecast#{query}"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json).to be_a(Hash)
        expect(json.keys).to eq([:id, :type, :attributes])
        expect(json[:id]).to eq(null)
        expect(json[:type]).to eq("forecast")
        expect(json[:attributes]).to be_a(Hash)
        expect(json[:attributes].keys).to eq([:current_weather, :daily_weather, :hourly_weather])
        expect(json[:attributes][:current_weather]).to be_a(Hash)
        expect(json[:attributes][:daily_weather]).to be_a(Array)
        expect(json[:attributes][:hourly_weather]).to be_a(Array)

        current = json[:attributes][:current_weather]
        expect(current.keys).to eq([:datetime, :sunrise, :sunset, :temperature, :feels_like, :humidity, :uvi, :visibility, :conditions, :icon])
        expect(current.datetime).to be_a(String)
        expect(current.sunrise).to be_a(String)
        expect(current.sunset).to be_a(String)
        expect(current.temperature).to be_a(Float)
        expect(current.feels_like).to be_a(Float)
        expect(current.humidity).to be_a_kind_of(Numeric)
        expect(current.uvi).to be_a_kind_of(Numeric)
        expect(current.visibility).to be_a_kind_of(Numeric)
        expect(current.conditions).to be_a(String)
        expect(current.icon).to be_a(String)

        daily_array = json[:attributes][:daily_weather]
        expect(daily_array).to be_a(Array)
        expect(daily_array.count).to eq(5)
        daily = daily_array.sample(1)[0]
        expect(daily).to be_a(Hash)
        expect(daily.keys).to eq([:date, :sunrise, :sunset, :max_temp, :min_temp, :conditions, :icon])
        expect(daily.date).to be_a(String)
        expect(daily.sunrise).to be_a(String)
        expect(daily.sunset).to be_a(String)
        expect(daily.max_temp).to be_a_kind_of(Numeric)
        expect(daily.min_temp).to be_a_kind_of(Numeric)
        expect(daily.conditions).to be_a(String)
        expect(daily.icon).to be_a(String)

        hourly_array = json[:attributes][:hourly_weather]
        expect(hourly_array).to be_a(Array)
        expect(hourly_array.count).to eq(8)
        hourly = hourly_array.sample(1)[0]
        expect(hourly).to be_a(Hash)
        expect(current.keys).to eq([:time, :temperature, :conditions, :icon])
        expect(hourly.time).to be_a(String)
        expect(hourly.temperature).to be_a_kind_of(Numeric)
        expect(hourly.conditions).to be_a(String)
        expect(hourly.icon).to be_a(String)
      end
    end

  end

end
