Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  root to: 'dashboard#index'
  get '/user/:id/dashboard', to:'dashboard#show', as: :user_dashboard
  get '/bike-shop', to: 'accessories#index', as: :bike_shop


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :carts, except: [:index]

  resources :trips, only: [:show, :index]
end
