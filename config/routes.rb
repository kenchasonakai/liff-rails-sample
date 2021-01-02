Rails.application.routes.draw do
  root 'logs#new'
  resources :logs
  resources :users
end
