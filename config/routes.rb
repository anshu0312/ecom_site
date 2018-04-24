Rails.application.routes.draw do
  resources :products
  devise_for :users

  resources :users, only: [:show] do
    resources :orders
  end

  root to: "home#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
