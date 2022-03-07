class BookFacade
  class << self

    def search(location, quantity)
      response = BookService.search(location, quantity)
      json = JSON.parse(response.body, symbolize_names: true)

      books = json[:docs].map do |book_hash|
        book_data = {}
        book_data[:isbn] = book_hash[:isbn]
        book_data[:title] = book_hash[:title]
        book_data[:publisher] = book_hash[:publisher]
        Book.new(book_data)
      end
      Books.new(json[:numFound], books)
    end
  end
end
