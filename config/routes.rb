Rails.application.routes.draw do

  devise_for :users
  root 'home#index'

  resources 'home', only: [:index]
  resources 'quotes' do
    resources :charges
  end
  resources 'users', only: [:show, :edit, :update]
  resources :customers

  get :payment_send, to: 'quotes#payment_send', as: :payment_send
end
