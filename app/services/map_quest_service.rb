class MapQuestService
  class << self

    def conn
      conn = Faraday.new(url:'http://www.mapquestapi.com')
    end

    def get_geocode(address)
      get_url("/geocoding/v1/address?location=#{formatted_address(address)}")
    end

    def get_url(url)
      response = conn.get(url + "&key=#{ENV['map_quest_api_key']}")
    end

    def formatted_address(address)
      # run checks to enrure address is valid
      # first split by commas, then remove white space or add '+' where spaces are needed
      parts = address.split(',')
      parts = parts.map{ |part| part.lstrip }
      parts[0] = parts[0].gsub(' ', '+')
      formatted_address = parts.join(',')
    end

  end
end
