Rails.application.routes.draw do
  devise_for :users
  root 'flowdash#show'
  resources 'home', only: [:index]
  resources 'customers'
  get 'flowdash/:page' => 'flowdash#show', as: 'flowdash'
end
