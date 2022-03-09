Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#search'
      get '/backgrounds', to: 'image#search'
      post '/users', to: 'users#register'
      post '/sessions', to: 'users#login'
      post '/road_trip', to: 'road_trip#road_trip'
    end
  end
end
