require 'rails_helper'

RSpec.describe 'Background Facade' do
  context 'good request' do
    describe 'search', :vcr do
      let!(:query) { "Denver" }
      let!(:image) { BackgroundFacade.search(query) }

      it "returns an image object", :vcr do
        expect(image).to be_a(Image)
      end
    end
  end

end
