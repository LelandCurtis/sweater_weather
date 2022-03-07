class DailyWeather < Weather
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp

  def initialize(data)
    @date = format_date(data[:dt])
    @sunrise = format_datetime(data[:sunrise])
    @sunset = format_datetime(data[:sunset])
    @max_temp = "#{data[:max_temp]} F"
    @min_temp = "#{data[:min_temp]} F"
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

end
