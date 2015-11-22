Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'businesses#index'
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  resources :sessions, only: [:create]
  resources :users, only: [:create]
  resources :categories, only: [:show]
end
