Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources 'home', only: [:index]
  resources 'quotes'
  resources 'goods'
  resources 'users', only: [:show, :edit, :update]
  resources :customers
end
