require 'rails_helper'

RSpec.describe 'MapQuest Facade' do
  describe 'get_geocode' do
    context 'good request', :vcr do
      let!(:address_1) { "1850 Bassett Street Apt 813, Denver, CO, 80202" }
      let!(:geocode) { MapQuestFacade.get_geocode(address_1) }

      it "returns a hash with lat and lng keys and coordinates" do
        expect(geocode).to be_a(Hash)
        expect(geocode.keys).to eq([:lat, :lng])
        expect(geocode[:lat]).to be_a(Float)
        expect(geocode[:lng]).to be_a(Float)
      end
    end
  end

  describe 'get_road_trip' do
    context 'good request', :vcr do
      let!(:origin) { 'New York, NY' }
      let!(:destination) { 'Los Angeles, CA' }
      let!(:roadtrip) { MapQuestFacade.get_road_trip(origin, destination) }

      it "returns expected data" do
        expect(roadtrip).to be_a(RoadTrip)
        expect(roadtrip.start_city).to eq('New York, NY')
        expect(roadtrip.end_city).to eq('Los Angeles, CA')
        expect(roadtrip.travel_time).to eq('40 hours, 16 minutes')
        expect(roadtrip.weather).to be_a(Hash)
        expect(roadtrip.weather[:temperature]).to be_a(Float)
        expect(roadtrip.weather[:conditions]).to be_a(String)
      end
    end
  end
end
