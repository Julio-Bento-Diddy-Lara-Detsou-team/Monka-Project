Rails.application.routes.draw do
  root 'flowdash#show'
  resources 'home', only: [:index]
  get 'flowdash/:page' => 'flowdash#show', as: 'flowdash'
end
