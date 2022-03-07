class UnsplashService
  class << self

    def get_url(url)
      Faraday.get("http://api.unsplash.com" + url)
    end

    def search(query)
      get_url("/search/photos?query=#{query}&client_id=#{ENV['unsplash_access_key']}")
    end

    def search_2(query)
      search_results = Unsplash::Photo.search("#{query} skyline")
    end

  end
end
