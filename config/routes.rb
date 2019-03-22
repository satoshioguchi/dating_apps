Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/signup',  to: 'users#new'
  get    '/matching',   to: 'users#matching'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :relationships,       only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]
end
