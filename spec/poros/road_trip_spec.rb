require 'rails_helper'

RSpec.describe 'road trip poro' do
  let!(:attributes) { {start_city: 'New York, NY',
                      end_city: 'Los Angeles, CA',
                      travel_time: "19:13:29",
                      weather: {
                        temperature: 84.4,
                        conditions: "cloudy and such"}
                    } }
  let!(:road_trip) { RoadTrip.new(attributes) }

  it 'exists' do
    expect(road_trip).to be_a(RoadTrip)
  end

  it "has correct attributes" do
    expect(road_trip.start_city).to eq(attributes[:start_city])
    expect(road_trip.end_city).to eq(attributes[:end_city])
    expect(road_trip.travel_time).to eq("19 hours, 13 minutes")
    expect(road_trip.weather).to be_a(Hash)
    expect(road_trip.weather[:temperature]).to eq(attributes[:weather][:temperature])
    expect(road_trip.weather[:conditions]).to eq(attributes[:weather][:conditions])
  end

end
