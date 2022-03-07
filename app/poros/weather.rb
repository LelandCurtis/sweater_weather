class Weather
  attr_reader :conditions, :icon

  def format_datetime(seconds_since_epoch)
    datetime = Time.at(seconds_since_epoch).to_datetime
    datetime.strftime("%Y-%m-%d %H:%M:%S %:z")
  end

  def format_date(seconds_since_epoch)
    date = Time.at(seconds_since_epoch).to_datetime
    date.strftime("%Y-%m-%d")
  end

  def format_time(seconds_since_epoch)
    time = Time.at(seconds_since_epoch).to_datetime
    time.strftime("%H:%M:%S")
  end
end
