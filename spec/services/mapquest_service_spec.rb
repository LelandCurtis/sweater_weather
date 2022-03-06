require 'rails_helper'

RSpec.describe 'MapQuest Geocode service' do
  context 'successful query' do
    describe 'GET /geocode' do

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
end
