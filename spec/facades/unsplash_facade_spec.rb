require 'rails_helper'

RSpec.describe 'Unsplash Facade' do
  context 'good request' do
    describe 'search', :vcr do
      let!(:query) { "Denver" }
      let!(:search_1) { UnsplashFacade.search(query) }
      #let!(:search_2) { UnsplashFacade.search_2(query) }

      it "returns a hash with lat and lng keys and coordinates" do


      end
    end
  end

end
