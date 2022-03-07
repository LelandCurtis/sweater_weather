class UnsplashFacade
  class << self

    def search(query)
      response = UnsplashService.search(query)
      #json = JSON.parse(response.body, symbolize_names: true)
    end

    def search_2(query)
      response = UnsplashService.search_2(query)
    end

  end
end
