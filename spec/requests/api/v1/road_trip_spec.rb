require 'rails_helper'

RSpec.describe 'GET /api/v1/road_trip' do
  context 'good request' do
    describe 'GET route', :vcr do
      let!(:from) { 'New York, NY' }
      let!(:to) { 'Los Angeles, CA' }
      let!(:request_data) { {from: from, to: to} }
      let!(:request) { get "/api/v1/road_trip", params: request_data.to_json }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns expected https response" do
        request
        expect(response.status).to eq(200)
      end

      it "returns expected data hash" do
        request
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)

        data = json[:data]
        expect(data).to be_a(Hash)
        expect(data).to have_key(:id)
        expect(data[:id]).to eq(nil)
        expect(data).to have_key(:type)
        expect(data[:type]).to eq("roadtrip")
        expect(data).to have_key(:attributes)
        expect(data[:attributes]).to eq(Hash)

        attr = data[:attributes]
        expect(attr).to have_key(:start_city)
        expect(attr[:start_city]).to eq(from)
        expect(attr).to have_key(:end_city)
        expect(attr[:end_city]).to eq(from)
        expect(attr).to have_key(:travel_time)
        expect(attr[:travel_time]).to be_a(String)
        expect(attr).to have_key(:weather_at_eta)
        expect(attr[:weather_at_eta]).to be_a(Hash)

        weather_at_eta = attr[:weather_at_eta]
        expect(weather_at_eta).to have_key(:temperature)
        expect(weather_at_eta[:temperature]).to be_a(Float)
        expect(weather_at_eta).to have_key(:conditions)
        expect(weather_at_eta[:conditions]).to be_a(String)
      end
    end
  end
end
