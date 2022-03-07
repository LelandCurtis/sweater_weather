require 'rails_helper'

RSpec.describe 'book service' do
  context 'good query' do
    describe 'search(book, count)' do
      let!(:location) { 'denver,co' }
      let!(:quantity) { 5 }
      let!(:query) { "location" }

      it "returns a hash with the book search and needed data", :vcr do
        response = BookService.search(location, quantity)
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to be_a(Hash)
        expect(json).to have_key(:numFound)
        expect(json[:numFound]).to be_a(Integer)

        expect(json).to have_key(:docs)
        expect(json[:docs]).to be_a(Array)
        expect(json[:docs].length).to eq(quantity)

        book = json[:docs].sample(1)[0]
        expect(book).to be_a(Hash)

        #ibsn, title, publisher
        expect(book).to have_key(:title)
        expect(book[:title]).to be_a(String)
        expect(book).to have_key(:ibsn)
        expect(book[:ibsn]).to be_a(Array)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
      end
    end
  end
end
