Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'businesses#index'
  get '/register', to: 'users#new'
  resources :users, only: [:create]
  resources :categories, only: [:show]
end
