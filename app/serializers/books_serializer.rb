class BooksSerializer
  class << self

    def books(books, forecast, query)
      {
        "data": {
          "id": "null",
          "type": "books",
          "attributes": {
            "destination": query,
            "forecast": {
              "summary": forecast.current.conditions,
              "temperature": forecast.current.temperature
            },
            "total_books_found": books.total_books_found,
            "books": books.books.map do |book|
              {
                "isbn": book.isbn,
                "title": book.title,
                "publisher": book.publisher
              }
            end
          }
        }
      }
    end

  end
end
