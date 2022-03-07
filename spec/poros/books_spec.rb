require 'rails_helper'

RSpec.describe 'books poro' do
  let!(:num_books) { 5 }
  let!(:books_array) { build_list(:book, num_books) }
  let!(:total_books_found) { 1280 }
  let!(:books) { Books.new(books_array, total_books_found) }

  it "exists" do
    expect(books).to be_a(Books)
    expect(books.total_books_found).to be_a(Integer)
    expect(books.total_books_found).to eq(total_books_found)
    expect(books.books).to be_a(Array)
    expect(books.books.count).to eq(num_books)
    expect(books.books[0]).to be_a(Book)
  end
end
