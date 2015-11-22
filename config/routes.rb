Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  get '/home', to: 'businesses#index'
  resources :categories, only: [:show]
end
