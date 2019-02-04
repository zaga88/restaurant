Rails.application.routes.draw do

  # Get login token from Knock
  post 'sign_in', to: 'user_token#create'

  resources :users, only: [:create, :update]
  get '/users/current', to: 'users#current'

  resources :restaurants, only: [:create]
  post '/restaurant/add_shift', to: 'restaurants#add_shift'
  post '/restaurant/add_table', to: 'restaurants#add_table'

  resources :reservations, only: [:create, :update]
end
