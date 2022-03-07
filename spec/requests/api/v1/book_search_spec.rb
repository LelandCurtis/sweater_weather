require 'rails_helper'

RSpec.describe 'book search GET /api/v1/book-search?location=xx&quantity=x' do
  context 'good query' do
    let!(:location) { "denver,co" }
    let!(:quantity) { 5 }

    it "returns the expected data", :vcr do
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response.status).to eq(200)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:data)
      data = json[:data]
      expect(data).to be_a(Hash)
      expect(data).to have_key(:id)
      expect(data[:id]).to eq("null")
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("books")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_a(Hash)

      attributes = data[:attributes]
      expect(attributes).to have_key(:destination)
      expect(attributes[:destination]).to eq(location)
      expect(attributes).to have_key(:forecast)
      expect(attributes[:forecast]).to be_a(Hash)
      expect(attributes[:forecast]).to have_key(:summary)
      expect(attributes[:forecast][:summary]).to be_a(String)
      expect(attributes[:forecast]).to have_key(:temperature)
      expect(attributes[:forecast][:temperature]).to be_a(String)
      expect(attributes).to have_key(:total_books_found)
      expect(attributes[:total_books_found]).to be_a(Integer)
      expect(attributes).to have_key(:books)
      expect(attributes[:books]).to be_a(Array)
      expect(attributes[:books].count).to eq(quantity)

      book = attributes[:books].sample(1)[0]

      expect(book).to be_a(Hash)
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_a(Array)
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_a(Array)

    end
  end

  context 'bad_query' do
    let!(:location) { "" }
    let!(:quantity) { 5 }

    it "returns error", :vcr do
      get "/api/v1/book-search?location=#{location}&quantity=#{quantity}"

      expect(response.status).to eq(400)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to be_a(Hash)
    end
  end
end
