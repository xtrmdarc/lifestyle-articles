Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create]
  resources :categories, only: [:index, :show]
  resources :articles, only: [:new, :create]
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'
  get '/votearticle/:id/:cat_id', to: 'articles#vote_for_article', as: :votearticle
  root 'categories#index'
end
