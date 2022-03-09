class MapQuestFacade
  class << self

    def get_geocode(address)
      response = MapQuestService.get_geocode(address)
      json = JSON.parse(response.body, symbolize_names: true)
      lat_lng = json[:results][0][:locations][0][:latLng]
    end

    def get_road_trip(from, to)
      response = MapQuestService.get_route(from, to)
      route_data = JSON.parse(response.body, symbolize_names: true)
      road_trip = RoadTrip.new(collect_roadtrip_data(route_data))
    end

    def get_arrival_hour(route_data)
      time = route_data[:route][:formattedTime]
      hour = time.split(':')[0].to_i
    end

    def get_eta_weather(route_data)
      arrival_hour = get_arrival_hour(route_data)
      destination = route_data[:route][:locations][1]
      destination_address = "#{destination[:adminArea5]}, #{destination[:adminArea3]}"
      forecast = ForecastFacade.get_forecast(destination_address, hour_count = (arrival_hour + 1))
      forecast_at_eta = forecast.hourly[arrival_hour]
    end

    def collect_roadtrip_data(route_data)
      data_hash = {}

      origin = route_data[:route][:locations][0]
      destination = route_data[:route][:locations][1]
      data_hash[:start_city] = "#{origin[:adminArea5]}, #{origin[:adminArea3]}"
      data_hash[:end_city] = "#{destination[:adminArea5]}, #{destination[:adminArea3]}"

      data_hash[:travel_time] = route_data[:route][:realTime]

      eta_weather = get_eta_weather(route_data)

      data_hash[:temperature] = eta_weather.temperature
      data_hash[:conditions] = eta_weather.conditions
      data_hash
    end

  end
end
