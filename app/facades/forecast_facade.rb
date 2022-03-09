class ForecastFacade
  class << self

    def get_forecast(location, hour_count = 8)
      latLon = MapQuestFacade.get_geocode(location)
      lat = latLon[:lat]
      lon = latLon[:lng]
      forecast = OpenWeatherMapFacade.get_forecast(lat, lon, hour_count = hour_count)
    end

  end
end
