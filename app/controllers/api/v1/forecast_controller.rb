class ForecastController << ApplicationController

  def search
    json_response(ForecastSerializer(ForecastFacade.get_forecast(params[:city], params[:state])) status: ok)
  end

end
