Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :transactions
  root "home#index"
end
