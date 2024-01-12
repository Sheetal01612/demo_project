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
  resources :category, only: [:index, :show, :update, :destroy]
  get 'create_category', to: 'category#new', as: :create_category
  post 'create_category', to: 'category#create'
  resources :product, only: [:index, :show, :update, :destroy]
  get 'create_product', to: 'product#new', as: :create_product
  post 'create_product', to: 'product#create'
  # post '/auth/login', to: 'authentication#login'
end