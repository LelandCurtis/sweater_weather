require 'rails_helper'

RSpec.describe 'Road Trip' do
  context 'good request' do
    describe 'GET /api/v1/road_trip', :vcr do
      let!(:origin) { 'New York, NY' }
      let!(:destination) { 'Los Angeles, CA' }
      let!(:api_key) {'jgn983hy48thw9begh98h4539h4'}
      let!(:request_data) { {origin: origin, destination: destination, api_key: api_key} }
      let!(:request) { post "/api/v1/road_trip", params: request_data.to_json }
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
        expect(data[:attributes]).to be_a(Hash)

        attr = data[:attributes]
        expect(attr).to have_key(:start_city)
        expect(attr[:start_city]).to eq(origin)
        expect(attr).to have_key(:end_city)
        expect(attr[:end_city]).to eq(destination)
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

  context 'bad request' do
    describe 'GET /api/v1/road_trip', :vcr do
      describe 'impossible destination' do
        let!(:origin) { 'New York, NY' }
        let!(:destination) { 'London, UK' }
        let!(:api_key) {'jgn983hy48thw9begh98h4539h4'}
        let!(:request_data) { {origin: origin, destination: destination, api_key: api_key} }
        let!(:request) { post "/api/v1/road_trip", params: request_data.to_json }
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
          expect(data[:attributes]).to be_a(Hash)

          attr = data[:attributes]
          expect(attr).to have_key(:start_city)
          expect(attr[:start_city]).to eq(origin)
          expect(attr).to have_key(:end_city)
          expect(attr[:end_city]).to eq(destination)
          expect(attr).to have_key(:travel_time)
          expect(attr[:travel_time]).to eq('impossible route')
          expect(attr).to have_key(:weather_at_eta)
          expect(attr[:weather_at_eta]).to eq(nil)
        end
      end

      describe 'no API key sent' do
        let!(:origin) { 'New York, NY' }
        let!(:destination) { 'London, UK' }
        let!(:request_data) { {origin: origin, destination: destination} }
        let!(:request) { post "/api/v1/road_trip", params: request_data.to_json }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns expected https response" do
          request
          expect(response.status).to eq(401)
        end

        it "returns expected data hash" do
          request
          expect(json).to be_a(Hash)
          expect(json).to have_key(:data)

          data = json[:data]
          expect(data).to be_a(Hash)
          expect(data).to have_key(:message)
          expect(data[:message]).to eq('No API key provided')
        end
      end
    end
  end
end
