class MapQuestFacade
  class << self

    def get_geocode(address)
      response = MapQuestService.get_geocode(address)
      json = JSON.parse(response.body, symbolize_names: true)
      lat_lng = json[:results][0][:locations][0][:latLng]
    end

  end
end
