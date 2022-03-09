require 'rails_helper'

RSpec.describe 'road trip poro' do
  let!(:attributes) { {start_city: 'New York, NY',
                      end_city: 'Los Angeles, CA',
                      travel_time: "19:13:29",
                      temperature: 84.4,
                      conditions: "cloudy and such"
                    } }
  let!(:road_trip) { RoadTrip.new(attributes) }

  it 'exists' do
    expect(road_trip).to be_a(RoadTrip)
  end

  it "has correct attributes" do
    expect(road_trip.start_city).to eq(attributes[:start_city])
    expect(road_trip.end_city).to eq(attributes[:end_city])
    expect(road_trip.travel_time).to eq("19 hours, 13 minutes")
    expect(road_trip.temperature).to eq(attributes[:temperature])
    expect(road_trip.conditions).to eq(attributes[:conditions])
  end

end
