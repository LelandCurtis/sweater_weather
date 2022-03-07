require 'rails_helper'

RSpec.describe 'book poro' do
  let!(:isbn) { ["9780883183663","0883183668"] }
  let!(:title) { "Photovoltaic safety, Denver, CO, 1988" }
  let!(:publisher) { ["Crescent Books",
                      "Random House Value Publishing",
                      "Distributed by Crown Publishers",
                      "Crescent"
                      ] }
  let!(:data) { {isbn: isbn, title: title, publisher: publisher} }
  let!(:book) { Book.new(data) }

  it "exists" do
    expect(book).to be_a(Book)
    expect(book.title).to be_a(String)
    expect(book.title).to eq(title)
    expect(book.isbn).to be_a(Array)
    expect(book.isbn).to eq(isbn)
    expect(book.publisher).to be_a(Array)
    expect(book.publisher).to eq(publisher)
  end
end
