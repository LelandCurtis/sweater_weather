require 'rails_helper'

RSpec.describe 'book service' do
  context 'good query' do
    describe 'search(book, count)' do
      let!(:location) { 'denver,co' }
      let!(:quantity) { 5 }

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
        expect(book).to have_key(:isbn)
        expect(book[:isbn]).to be_a(Array)
        expect(book).to have_key(:publisher)
        expect(book[:publisher]).to be_a(Array)
      end
    end
  end

  context 'bad query' do
    describe 'search(book, count)' do
      let!(:location) { '' }
      let!(:quantity) { "hasljh" }

      it "returns an error respones and error message", :vcr do
        response = BookService.search(location, quantity)

        expect(response.status).to eq(200)
        json = JSON.parse(response.body, symbolize_names: true)

      end
    end
  end
end
