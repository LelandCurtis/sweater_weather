class RoadTripSerializer

  def self.road_trip(road_trip)
    {
      "data": {
        "id": nil,
        "type": "roadtrip",
        "attributes": {
          "start_city": road_trip.start_city,
          "end_city": road_trip.end_city,
          "travel_time": road_trip.travel_time,
          "weather_at_eta": road_trip.weather
        }
      }
    }


  end

end
