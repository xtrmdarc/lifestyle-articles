Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :categories, only: [:index, :show]
  resources :articles, only: [:new, :create, :index, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  root 'categories#index'
end
