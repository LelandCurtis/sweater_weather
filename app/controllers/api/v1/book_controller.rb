class Api::V1::BookController < ApplicationController

  def search
    books = BookFacade.search(params[:location], params[:quantity])

    if books
      latLon = MapQuestFacade.get_geocode(params[:location])
      forecast = OpenWeatherMapFacade.get_forecast(latLon[:lat], latLon[:lng])
      json_response(BooksSerializer.books(books, forecast, params[:location]), :ok)
    else
      json_response({data: {message: "Error, bad request"}}, :bad_request)
    end
  end

end
