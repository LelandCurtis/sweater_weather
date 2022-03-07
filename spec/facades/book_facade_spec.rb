require 'rails_helper'

RSpec.describe 'book facade' do
  describe 'search' do
    context 'good search' do
      let!(:location) { 'denver,co' }
      let!(:quantity) { 5 }

      it "returns an array of book objects with correct data", :vcr do
        books = BookFacade.search(location, quantity)

        expect(books).to be_a(Books)
        expect(books.total_books_found).to eq(quantity)
        expect(books.books).to be_a(Array)
        book = books.books.sample(1)[0]

        expect(book).to be_a(Book)
        expect(book.title).to be_a(String)
        expect(book.isbn).to be_a(Array)
        expect(book.publisher).to be_a(Array)
      end
    end
  end
end
