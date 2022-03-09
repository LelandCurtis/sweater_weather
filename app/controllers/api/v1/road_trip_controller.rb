class Api::V1::RoadTripController < ApplicationController

  def road_trip
    request_params = request_json
    road_trip = MapQuestFacade.get_road_trip(request_params[:origin], request_params[:destination])
    json_response(RoadTripSerializer.road_trip(road_trip), :ok)
  end

  private

  def request_json
    JSON.parse(request.body.string, symbolize_names: true)
  end

end
