class HourlyWeather < Weather
  attr_reader :time,
              :temperature

  def initialize(data)
    @time = format_time(data[:dt])
    @temperature = "#{data[:temperature]} F"
    @conditions = data[:conditions]
    @icon = data[:icon]
  end

end
