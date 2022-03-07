class Api::V1::ForecastController < ApplicationController

  def search
    latLon = MapQuestFacade.get_geocode("#{params[:city]}, #{params[:state]}")
    lat = latLon[:lat]
    lon = latLon[:lng]
    forecast = OpenWeatherMapFacade.get_forecast(lat, lon)
    json_response(ForecastSerializer.forecast(forecast), :ok)
  end

end
