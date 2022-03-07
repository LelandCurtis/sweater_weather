require 'rails_helper'

RSpec.describe 'POST /api/v1/users' do

  context 'good credentials' do
    let!(:user) { create(:user, email: "whatever@example.com", password: "password" ) }
    let!(:request_data) { {"email": "whatever@example.com",
                          "password": "password",
                          "password_confirmation": "password"}
                        }
    it "returns the expected data hash and status code", :vcr do
      post '/api/v1/users', params: request_data.to_json

      expect(response.status).to eq(200) 
    end
  end
end
