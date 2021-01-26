Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :create]
  end

  resources :users, only: [:show]
    namespace :admin do
      resources :items
    end
end
