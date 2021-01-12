Rails.application.routes.draw do
  get '/logged_in' => 'session#is_logged_in'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :images
  resources :properties
  resources :reviews
  resources :reservations
  resources :users

  root to: 'pages#home'

  # Payment routes
  post '/pay/:id' => 'payment#create'

  # root 'hompage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
