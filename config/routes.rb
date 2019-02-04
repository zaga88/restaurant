Rails.application.routes.draw do

  # Get login token from Knock
  post 'sign_in', to: 'user_token#create'

  resources :users, only: [:create, :update]

  resources :restaurants, only: [:create]
  get '/restaurants/reservations'
  post '/restaurants/add_shift'
  post '/restaurants/add_table'

  resources :reservations, only: [:create, :update]
end
