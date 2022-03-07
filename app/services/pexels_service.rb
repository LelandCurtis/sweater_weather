class PexelsService
  class << self

    def search(query)
      client = Pexels::Client.new("#{ENV['pexels_api_key']}")
      client.photos.search(query)
    end
  end
end
