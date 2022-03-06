require 'rails_helper'

RSpec.describe 'MapQuest Geocode service' do
  context 'successful query' do
    describe 'GET /geocode', :vcr do
      let!(:address_1) { "1850 Bassett Street Apt 813, Denver, CO, 80202" }
      let!(:address_2) { "1600+Pennsylvania+Ave+NW,Washington,DC,20500" }
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
  end
end
