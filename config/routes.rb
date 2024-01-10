Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/welcome'
  root 'home#welcome'
  resources :users, only: [:show, :update, :destroy]
  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create'
  get "login", to: "authentication#new", as: :login
  post "login", to: "authentication#create"
  get "logout", to: "authentication#destroy", as: :logout
  resources :category, only: [:create, :index]
  resources :products, only: [:create, :show]
  # post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'
end