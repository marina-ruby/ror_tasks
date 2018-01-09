Rails.application.routes.draw do
  resources :tags
  resources :authors
  resources :articles do
    resources :comments
  end
  resources :users, except: [:new, :create, :index, :destroy]
  root 'articles#index'
end
