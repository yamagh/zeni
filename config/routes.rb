Rails.application.routes.draw do
  root to: 'dashboards#show'
  get 'dashboards/show'

  resources :logs
  resources :stores
  get 'last_store', to: 'stores#last_store'
  get 'categories/categories'
  resources :categories do
    resources :sub_categories
  end
  get 'sub_categories/sub_categories'
  resources :accounts

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
