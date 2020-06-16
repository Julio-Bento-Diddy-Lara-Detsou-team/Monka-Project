Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources 'home', only: [:index]
  resources 'quotes'
  resources 'users', only: [:show, :edit, :update] do
    resources :logo, only: [:create]
  end
  resources :customers
  resources :charges, only: [:new, :create]
end
