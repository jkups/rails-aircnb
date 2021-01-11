Rails.application.routes.draw do
  get '/logged_in' => 'session#is_logged_in'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/' => 'reservations#index'

  resources :reviews
  resources :reservations
  resources :users

  # root 'hompage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
