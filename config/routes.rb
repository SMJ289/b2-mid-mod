Rails.application.routes.draw do

get '/mechanics', to: 'mechanics#index'

get '/amusement_parks/:park_id', to: 'amusement_parks#show'

end
