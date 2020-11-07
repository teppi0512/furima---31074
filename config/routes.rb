Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
=======
  get 'furimas/index'
  devise_for :users

  root to: 'users#index'
  resources :users

>>>>>>> Stashed changes
end
