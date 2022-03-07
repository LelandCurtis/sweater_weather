require 'rails_helper'

RSpec.describe 'image endpoint GET /api/v1/backgrounds?location=denver,co' do
  context 'successful query' do
    describe 'backgrounds' do
      let!(:query) { "?location=denver" }

      it "returns the forecast for the given city and state", :vcr do
        get "/api/v1/backgrounds#{query}"

        json = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(json).to be_a(Hash)
        expect(json).to have_key(:data)
        data = json[:data]
        expect(data.keys).to eq([:id, :type, :attributes])
        expect(data[:id]).to eq(nil)
        expect(data[:type]).to eq("image")
        expect(data[:attributes]).to be_a(Hash)
        expect(data[:attributes]).to have_key(:image)
        expect(data[:attributes][:image]).to be_a(Hash)
        expect(data[:attributes][:image].keys).to eq([:height, :width, :location, :image_url, :author])
      end
    end
  end
end
