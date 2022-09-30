Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :operations
  root "home#index"
end
