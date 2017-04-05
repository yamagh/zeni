Rails.application.routes.draw do
  resources :logs
  resources :stores
  resources :sub_categories
  resources :categories
  resources :accounts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
