require 'rails_helper'

RSpec.describe 'books poro' do
  let!(:isbn) { ["9780883183663","0883183668"] }
  let!(:title) { "Photovoltaic safety, Denver, CO, 1988" }
  let!(:publisher) { ["Crescent Books",
                      "Random House Value Publishing",
                      "Distributed by Crown Publishers",
                      "Crescent"
                      ] }
  let!(:data) { {isbn: isbn, title: title, publisher: publisher} }
  let!(:book) { Book.new(data) }

  let!(:num_books) { 5 }
  let!(:books_array) { [].fill(book, 0, num_books) }
  let!(:total_books_found) { 1280 }
  let!(:books) { Books.new(total_books_found, books_array) }

  it "exists" do
    expect(books).to be_a(Books)
    expect(books.total_books_found).to be_a(Integer)
    expect(books.total_books_found).to eq(total_books_found)
    expect(books.books).to be_a(Array)
    expect(books.books.count).to eq(num_books)
    expect(books.books[0]).to be_a(Book)
  end
end
