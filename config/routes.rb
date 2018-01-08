Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :articles
  resources :authors

  root 'articles#index'
end
