Rails.application.routes.draw do

  devise_for :users
  root 'home#index'
  
  get 'flowdash/:page' => 'flowdash#show', as: 'flowdash'
  
  resources 'home', only: [:index]
  resources 'quotes'
  resources 'users', only: [:show, :edit, :update]
end
