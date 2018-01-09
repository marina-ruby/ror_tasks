Rails.application.routes.draw do
  get 'sessions/new'

  resources :tags
  resources :authors
  resources :articles do
    resources :comments
  end
  resources :users, except: [ :new, :create, :index, :show, :destroy ]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'articles#index'
end
