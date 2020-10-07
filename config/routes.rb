Rails.application.routes.draw do
  # Root page
  root 'home#index'

  # Manage 404 and 500 errors
  get 'errors/not_found'
  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # Devise
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources 'home', only: [:index, :show]
  resources 'quotes' do
    resources :charges
  end
  resources 'users', only: [:show, :edit, :update] do
    resources :logo, only: [:create]
  end
  resources 'goods'
  resources :customers
  get "contact", to: "static_pages#contact"
  get "general-condition-of-use", to: "static_pages#general_condition_of_use"

  get :payment_send, to: 'quotes#payment_send', as: :payment_send
end
