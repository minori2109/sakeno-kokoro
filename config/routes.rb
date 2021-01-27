Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :create]
  end
  namespace :admin do
    resources :items
  end

  resources :reviews, only: [:show]
  resources :users, only: [:show]

end
