class Api::V1::ImageController < ApplicationController

  def search
    image = BackgroundFacade.search(params[:location])
    json_response(ImageSerializer.image(image), :ok)
  end

end
