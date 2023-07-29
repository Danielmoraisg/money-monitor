# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static_pages/home'
  resources :stocks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'static_pages#home'
  post 'sign_up', to: 'users#create'
  get 'sign_up', to: 'users#new'
  resources :confirmations, only: %i[create edit new], param: :confirmation_token
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  resources :passwords, only: %i[create edit new update], param: :password_reset_token
  put "account", to: "users#update"
  get "account", to: "users#edit"
  delete "account", to: "users#destroy"
  resources :active_sessions, only: [:destroy] do
    collection do
      delete "destroy_all"
    end
  end
end
