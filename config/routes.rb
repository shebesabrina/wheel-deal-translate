Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboard#index', as: :dashboard
  root to: 'dashboard#index'
  get '/user/:id/dashboard', to: 'dashboard#show', as: :user_dashboard
  get '/trips-dashboard', to: 'trips#dashboard', as: :trips_dashboard

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, except: :index
  resources :stations, only: [:index]
  get '/:name', to: 'stations#show', as: :station

  resources :trips, only: [:show, :index]
end
