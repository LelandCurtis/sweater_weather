require 'rails_helper'

RSpec.describe 'MapQuest Geocode service' do
  describe 'GET /geocode' do
    context 'successful query' do

      describe 'Full formatted address', :vcr do
        let!(:address_1) { "1600+Pennsylvania+Ave+NW,Washington,DC,20500" }
        let!(:response) { MapQuestService.get_geocode(address_1) }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns a successful https status code" do
          expect(response.status).to eq(200)
        end

        it "returns expected json format" do
          expect(json).to be_a(Hash)
          expect(json.keys).to eq([:info, :options, :results])
          expect(json[:results]).to be_a(Array)
          results = json[:results][0]
          expect(results).to be_a(Hash)
          expect(results.keys).to eq([:providedLocation, :locations])
          location = results[:locations][0]
          expect(location).to be_a(Hash)
          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)
          expect(location[:latLng].keys).to eq([:lat, :lng])
          expect(location[:latLng][:lat]).to be_a(Float)
          expect(location[:latLng][:lng]).to be_a(Float)
        end
      end

      describe 'Full unformatted address', :vcr do
        let!(:address_2) { "1850 Bassett Street Apt 813, Denver, CO, 80202" }
        let!(:response) { MapQuestService.get_geocode(address_2) }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns a successful https status code" do
          expect(response.status).to eq(200)
        end

        it "returns expected json format" do
          expect(json).to be_a(Hash)
          expect(json.keys).to eq([:info, :options, :results])
          expect(json[:results]).to be_a(Array)
          results = json[:results][0]
          expect(results).to be_a(Hash)
          expect(results.keys).to eq([:providedLocation, :locations])
          location = results[:locations][0]
          expect(location).to be_a(Hash)
          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)
          expect(location[:latLng].keys).to eq([:lat, :lng])
          expect(location[:latLng][:lat]).to be_a(Float)
          expect(location[:latLng][:lng]).to be_a(Float)
        end
      end

      describe 'City, state, zipcode address', :vcr do
        let!(:address_3) { "Denver, CO, 80202" }
        let!(:response) { MapQuestService.get_geocode(address_3) }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns a successful https status code" do
          expect(response.status).to eq(200)
        end

        it "returns expected json format"do
          expect(json).to be_a(Hash)
          expect(json.keys).to eq([:info, :options, :results])
          expect(json[:results]).to be_a(Array)
          results = json[:results][0]
          expect(results).to be_a(Hash)
          expect(results.keys).to eq([:providedLocation, :locations])
          location = results[:locations][0]
          expect(location).to be_a(Hash)
          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)
          expect(location[:latLng].keys).to eq([:lat, :lng])
          expect(location[:latLng][:lat]).to be_a(Float)
          expect(location[:latLng][:lng]).to be_a(Float)
        end
      end

      describe 'City, state address', :vcr do
        let!(:address_4) { "Denver, CO" }
        let!(:response) { MapQuestService.get_geocode(address_4) }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns a successful https status code" do
          expect(response.status).to eq(200)
        end

        it "returns expected json format" do
          expect(json).to be_a(Hash)
          expect(json.keys).to eq([:info, :options, :results])
          expect(json[:results]).to be_a(Array)
          results = json[:results][0]
          expect(results).to be_a(Hash)
          expect(results.keys).to eq([:providedLocation, :locations])
          location = results[:locations][0]
          expect(location).to be_a(Hash)
          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)
          expect(location[:latLng].keys).to eq([:lat, :lng])
          expect(location[:latLng][:lat]).to be_a(Float)
          expect(location[:latLng][:lng]).to be_a(Float)
        end
      end

      describe 'City address', :vcr do
        let!(:address_5) { "Denver" }
        let!(:response) { MapQuestService.get_geocode(address_5) }
        let!(:json) { JSON.parse(response.body, symbolize_names: true) }

        it "returns a successful https status code" do
          expect(response.status).to eq(200)
        end

        it "returns expected json format" do
          expect(json).to be_a(Hash)
          expect(json.keys).to eq([:info, :options, :results])
          expect(json[:results]).to be_a(Array)
          results = json[:results][0]
          expect(results).to be_a(Hash)
          expect(results.keys).to eq([:providedLocation, :locations])
          location = results[:locations][0]
          expect(location).to be_a(Hash)
          expect(location).to have_key(:latLng)
          expect(location[:latLng]).to be_a(Hash)
          expect(location[:latLng].keys).to eq([:lat, :lng])
          expect(location[:latLng][:lat]).to be_a(Float)
          expect(location[:latLng][:lng]).to be_a(Float)
        end
      end
    end
  end

  describe 'GET /directions/v2/route' do
    context 'good request', :vcr do
      let!(:from) { 'New York, NY' }
      let!(:to) { 'Los Angeles, CA' }
      let!(:response) { MapQuestService.get_route(from, to) }

      it "returns expected http response" do
        response
        expect(response.status).to eq(200)
      end

      it "returns expected critical data in hash" do
        response
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json).to be_a(Hash)
        expect(json).to have_key(:route)
        expect(json[:route]).to be_a(Hash)

        route = json[:route]
        expect(route).to have_key(:formattedTime)
        expect(route[:formattedTime]).to be_a(String)
        expect(route).to have_key(:realTime)
        expect(route[:realTime]).to be_a(Integer)
        expect(route).to have_key(:locations)
        expect(route[:locations]).to be_a(Array)

        start = route[:locations][0]
        expect(start).to be_a(Hash)
        expect(start).to have_key(:adminArea5)
        expect(start[:adminArea5]).to be_a(String)
        expect(start).to have_key(:adminArea3)
        expect(start[:adminArea3]).to be_a(String)

        destination = route[:locations][1]
        expect(destination).to be_a(Hash)
        expect(destination).to have_key(:adminArea5)
        expect(destination[:adminArea5]).to be_a(String)
        expect(destination).to have_key(:adminArea3)
        expect(destination[:adminArea3]).to be_a(String)
      end
    end
  end
end
