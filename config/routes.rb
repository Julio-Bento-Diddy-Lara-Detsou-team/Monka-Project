Rails.application.routes.draw do
  root 'flowdash#show'
  resources 'home', only: [:index]
  resources :quotes

  get 'flowdash/:page' => 'flowdash#show', as: 'flowdash'
  devise_for :users
  resources 'users', only: [:show, :edit, :update]
end
