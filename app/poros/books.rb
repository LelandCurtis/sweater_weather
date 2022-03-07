class Books
  attr_reader :total_books_found, :books

  def initialize(total_books_found, books)
    @total_books_found = total_books_found
    @books = books
  end
end
