Rails.application.routes.draw do
  resources :logs
  resources :stores
  resources :categories do
    resources :sub_categories
  end
  resources :accounts
  root to: 'logs#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
