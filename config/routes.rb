Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'dashboard#index'
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/user/:id/dashboard', to:'dashboard#show', as: :user_dashboard

  get '/trips-dashboard', to: 'trips#dashboard', as: :trips_dashboard
  get '/bike-shop', to: 'accessories#index', as: :bike_shop

  get '/cart', to: 'carts#show', as: :cart
  delete '/cart/:id', to: 'carts#destroy', as: :cart_destroy

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
    resources :bike_shop, only: [:index]
    get '/bike-shop/new', to: 'accessories#new', as: :bike_shop_accessory_new
    post '/bike-shop/new', to: 'accessories#create', as: :bike_shop_accessories
  end

  namespace :admin do
    get '/dashboard', to: 'dashboard#show', as: :dashboard
  end

  namespace :admin do
    resources :trips
  end
end
