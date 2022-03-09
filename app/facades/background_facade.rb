class BackgroundFacade
  class << self

    def search(query)
      response = PexelsService.search(query)
      json_raw = response.to_json
      json = JSON.parse(json_raw, symbolize_names: true)
      Image.new(format_image_params(json[0], query))
    end

    def format_image_params(pic, location)
      data = {}
      data[:height] = pic[:height]
      data[:width] = pic[:width]
      data[:url] = pic[:url]
      data[:author] = pic[:user][:name]
      data[:location] = location
      data
    end

  end
end
