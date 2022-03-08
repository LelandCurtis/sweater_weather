class Api::V1::UsersController < ApplicationController

  def register
    json = JSON.parse(request.body.string, symbolize_names: true)
    new_api_key = Faker::Alphanumeric.alphanumeric(number: 27)
    user = User.create(email: json[:email], password: json[:password], password_confirmation: json[:password_confirmation], api_key: new_api_key)

    if user.id
      json_response(UsersSerializer.new(user), :created)
    else
      json_response({data: {message: "#{user.errors.full_messages.to_sentence}"}}, :bad_request)
    end
  end

  def login
    json = JSON.parse(request.body.string, symbolize_names: true)
  end

  private



end
