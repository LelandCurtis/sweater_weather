require 'rails_helper'

RSpec.describe 'MapQuest Geocode service' do
  context 'successful query' do
    describe 'GET /geocode' do
      let!(:address) { "1850 Bassett Street, Denver CO" }
      let!(:response) { MapQuestService.get_geocode(address) }
      let!(:json) { JSON.parse(response.body, symbolize_names: true) }

      it "returns a successful https status code" do
        expect(response).to be_sucessful
      end

      it "returns expected json format" do
        expect(json).to be_a(Hash)
        expect(json).to have_keys([:info, :options, :results])
        expect(json[:results]).to be_a(Array)
        results = json[:results][0]
        expect(results).to be_a(Hash)
        expect(results).to have_keys([:providedLocation, :locations])
        location = results[:locations][0]
        expect(location).to be_a(Hash)
        expect(location).to have_key(:latLng)
        expect(location[:latLng]).to be_a(Hash)
        expect(location[:latLng]).to have_keys([:lat, :lng])
      end
    end
  end
end
