Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'items/index'
  devise_for :users

  root to: 'users#index'
  resources :users

  devise_for :users
  root to: "items#index"

  resources :items, only: [:new, :create, :show] do
  end

  
end
