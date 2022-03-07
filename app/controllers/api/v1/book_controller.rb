class Api::V1::BookController < ApplicationController

  def search
    books = BookFacade.search(params[:location], params[:quantity])
    latLon = MapQuestFacade.get_geocode(params[:location])
    forecast = OpenWeatherMapFacade.get_forecast(latLon[:lat], latLon[:lng])
    json_response(BooksSerializer.books(books, forecast, params[:location]), :ok)
  end

end
