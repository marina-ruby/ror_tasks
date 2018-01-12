Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :tags
  resources :authors
  resources :users, except: [:new, :create, :index, :show, :destroy]
  resources :list_reports
  resources :articles do
    resources :comments
  end
  root 'articles#index'
end
