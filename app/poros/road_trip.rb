class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :temperature, :conditions

  def initialize(data)
    @start_city = data[:start_city]
    @end_city = data[:end_city]
    @travel_time = format_trip_time(data[:travel_time])
    @temperature = data[:temperature]
    @conditions = data[:conditions]
  end

  def format_trip_time(seconds_since_epoch)
    time = Time.at(seconds_since_epoch).to_datetime
    "#{time.hour} hours, #{time.minute} minutes"
  end
end
