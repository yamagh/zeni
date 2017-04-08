Rails.application.routes.draw do
  resources :logs
  resources :stores
  resources :categories do
    resources :sub_categories
  end
  resources :accounts
  devise_for :users
  root to: 'logs#index'
end
