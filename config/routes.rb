Rails.application.routes.draw do

  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  resources 'home', only: [:index, :show]
  resources 'quotes' do
    resources :charges
  end
  resources 'users', only: [:show, :edit, :update] do
    resources :logo, only: [:create]
  end
  resources 'goods'
  resources :customers
  resources :contacts, only: [:index]
  resources :general_conditions_of_use, only: [:index]

  get :payment_send, to: 'quotes#payment_send', as: :payment_send

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
end
