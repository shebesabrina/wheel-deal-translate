Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root to: 'dashboard#index'
  get '/dashboard', to: 'dashboard#index', as: :dashboard
  get '/user/:id/dashboard', to:'dashboard#show', as: :user_dashboard
  post '/user/:id/dashboard', to:'dashboard#show'

  get '/trips-dashboard', to: 'trips#dashboard', as: :trips_dashboard
  get '/bike-shop', to: 'accessories#index', as: :bike_shop

  get '/cart', to: 'carts#show', as: :cart
  patch '/carts', to: 'carts#update'
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
    post "/bike-shop/new", to: "accessories#create", as: :bike_shop_accessories
    get '/bike-shop/new', to: 'accessories#new', as: :bike_shop_accessory_new
    post '/bike-shop/new', to: 'accessories#create', as: :bike_shop_accessories
    get '/bike-shop', to: 'accessories#index', as: :bike_shop
    patch '/bike-shop', to: 'accessories#update', as: :update_accessory
  end

  namespace :admin do
    resources :trips
    resources :accessories
    resources :stations
    get '/dashboard', to: 'dashboard#show', as: :dashboard
  end


end
