class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather

  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = format_trip_time(data[:travel_time])
    @weather = data[:weather]
  end

  def format_trip_time(formatted_time)
    if formatted_time == 'impossible route'
      formatted_time
    else
      time = formatted_time.split(':')
      "#{time[0]} hours, #{time[1]} minutes"
    end
  end
end
