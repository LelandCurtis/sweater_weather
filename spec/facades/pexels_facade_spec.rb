require 'rails_helper'

RSpec.describe 'Pexels Facade' do
  context 'good request' do
    describe 'search', :vcr do
      let!(:query) { "Denver" }
      let!(:image) { PexelsFacade.search(query) }

      it "returns a hash with lat and lng keys and coordinates", :vcr do
        expect(image).to be_a(Image)
      end
    end
  end

end
