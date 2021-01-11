Rails.application.routes.draw do
  root 'logs#new'
  resources :logs do
    collection do
      post :muni
    end
  end
  resources :users
end
