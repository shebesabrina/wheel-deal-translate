Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'dashboard#index'
  get '/bike-shop', to: 'accessories#index', as: :bike_shop
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/trips-dashboard', to: 'trips#dashboard', as: :trips_dashboard
  get '/user/:id/dashboard', to:'dashboard#show', as: :user_dashboard
  get '/cart', to: 'carts#show', as: :cart

  resources :carts, except: [:index]

  resources :stations, except: [:show]
  get '/station/:name', to: 'stations#show'
  get '/stations-dashboard', to: 'stations#dashboard', as: :stations_dashboard

  resources :carts, except: [:index]

  resources :trips, only: [:show, :index]
  resources :accessories, only: [:show, :index]

  resources :accessories

  resources :users

  namespace :admin do
    resources :accessories, only: [:index]
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#show', as: :dashboard
  end

  namespace :admin do
    resources :trips
  end
end
