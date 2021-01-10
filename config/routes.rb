Rails.application.routes.draw do
  resources :images
  resources :properties
  get '/' => 'reservations#index'

  resources :reviews
  resources :reservations
  resources :users

  # root 'hompage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
