class OpenWeatherMapFacade
  class << self

    def get_forecast(lat, lon)
      response = OpenWeatherMapService.get_forecast(lat, lon)
      json = JSON.parse(response.body, symbolize_names: true)

      current_weather = CurrentWeather.new(clean_current_weather_data(json[:current]))
      hourly_weather = json[:hourly][0..7].map do |hour|
        HourlyWeather.new(clean_hourly_weather_data(hour))
      end
      daily_weather = json[:daily][0..4].map do |day|
        DailyWeather.new(clean_daily_weather_data(day))
      end
      Forecast.new(current_weather, daily_weather, hourly_weather)
    end

    def clean_current_weather_data(data)
      output_data = {}
      output_data[:dt] = data[:dt]
      output_data[:sunrise] = data[:sunrise]
      output_data[:sunset] = data[:sunset]
      output_data[:temperature] = data[:temp]
      output_data[:feels_like] = data[:feels_like]
      output_data[:humidity] = data[:humidity]
      output_data[:uvi] = data[:uvi]
      output_data[:visibility] = data[:visibility]
      output_data[:conditions] = data[:weather][0][:description]
      output_data[:icon] = data[:weather][0][:icon]
      output_data
    end

    def clean_hourly_weather_data(data)
      output_data = {}
      output_data[:dt] = data[:dt]
      output_data[:temperature] = data[:temp]
      output_data[:conditions] = data[:weather][0][:description]
      output_data[:icon] = data[:weather][0][:icon]
      output_data
    end

    def clean_daily_weather_data(data)
      output_data = {}
      output_data[:dt] = data[:dt]
      output_data[:sunrise] = data[:sunrise]
      output_data[:sunset] = data[:sunset]
      output_data[:max_temp] = data[:temp][:max]
      output_data[:min_temp] = data[:temp][:min]
      output_data[:conditions] = data[:weather][0][:description]
      output_data[:icon] = data[:weather][0][:icon]
      output_data
    end

  end
end
