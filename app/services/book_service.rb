class BookService
  class << self

    def conn
      Faraday.new("http://openlibrary.org")
    end

    def get_url(url)
      conn.get(url)
    end

    def search(query, limit)
      get_url("/search.json?q=#{query}&limit=#{limit}")
    end

  end
end
