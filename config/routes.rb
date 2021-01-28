Rails.application.routes.draw do
  post '/contact/create' => 'contact#create'
  get '/logged_in' => 'session#is_logged_in'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/dashboard' => 'dashboard#index'

  resources :images
  resources :properties
  get '/properties/search/:search_term/' => 'properties#search'

  get '/properties/search/:term/:type/:limit/:offset/:pricerange' => 'properties#search_limit'

  get '/properties/search/:search_term/:limit/:offset' => 'properties#search_limit'

  get '/properties/searchtype/:search_term/:search_type/:limit/:offset' => 'properties#search_type_limit'

  get '/properties/searchprice/:search_term/:lower/:higher/:limit/:offset' => 'properties#search_price_limit'
  resources :reviews
  resources :reservations
  resources :users

  root to: 'pages#home'

  # Payment routes
  post '/pay/:id' => 'payment#create'


  # root 'hompage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
