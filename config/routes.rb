Rails.application.routes.draw do
  devise_for :users
  root 'flowdash#show'
  resources 'home', only: [:index]
  get 'flowdash/:page' => 'flowdash#show', as: 'flowdash'
end
