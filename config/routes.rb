Rails.application.routes.draw do
  resources :comments
  resources :tags
  resources :articles
  resources :authors
  resources :list_reports
end
