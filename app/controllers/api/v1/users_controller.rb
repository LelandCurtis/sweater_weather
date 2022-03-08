class Api::V1::UsersController < ApplicationController

  def register
    json = request_json
    new_api_key = Faker::Alphanumeric.alphanumeric(number: 27)
    user = User.create(email: json[:email], password: json[:password], password_confirmation: json[:password_confirmation], api_key: new_api_key)

    if user.id
      json_response(UsersSerializer.new(user), :created)
    else
      json_response({data: {message: "#{user.errors.full_messages.to_sentence}"}}, :bad_request)
    end
  end

  def login
    json = request_json
    user = User.find_by(email: json[:email])
    require "pry"; binding.pry
    if user.id && user.authenticate(password: json[:password])
      json_response(UsersSerializer.new(user), :ok)
    else
      json_response({data: {message: "Invalid credentials"}}, :unauthorized)
    end
  end

  private

    def request_json
      JSON.parse(request.body.string, symbolize_names: true)
    end

end
