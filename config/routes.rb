Rails.application.routes.draw do
  resources :remote
  root 'remote#index'
end
