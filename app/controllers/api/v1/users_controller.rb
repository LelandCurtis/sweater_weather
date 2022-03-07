class Api::V1::UsersController < ApplicationController

  def login
    json = JSON.parse(request.body.string, symbolize_names: true)
  end

end
