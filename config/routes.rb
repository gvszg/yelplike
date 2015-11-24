Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  root 'pages#front'
  get '/home', to: 'businesses#index'
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  resources :users, only: [:create, :show]
  resources :categories, only: [:show]
  resources :businesses, only: [:show, :new, :create] do
    resources :reviews, only: [:create]
  end
  resources :reviews, only: [:index]
end
