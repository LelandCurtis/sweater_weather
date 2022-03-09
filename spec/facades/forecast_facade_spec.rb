require 'rails_helper'

RSpec.describe 'ForecastFacade' do
  describe 'get_forecast', :vcr do
    context 'good request' do
      let!(:location) {'Denver, Co'}

      it "returns a forecast object from a location" do
        forecast = ForecastFacade.get_forecast(location)
        expect(forecast).to be_a(Forecast)
      end

      it "returns a forecast object from a location with custom hour count" do
        forecast = ForecastFacade.get_forecast(location, hour_count = 22)
        expect(forecast).to be_a(Forecast)
        expect(forecast.hourly.count).to eq(22)
      end
    end

  end
end
