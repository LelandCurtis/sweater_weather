class Api::V1::ForecastController < ApplicationController

  def search
    forecast = ForecastFacade.get_forecast("#{params[:location]}")
    json_response(ForecastSerializer.forecast(forecast), :ok)
  end

end
