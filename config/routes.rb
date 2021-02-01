Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :create]
    resources :favorites, only: [:create, :destroy]
  end
  namespace :admin do
    resources :items
  end

  resources :reviews, only: [:show]
  resources :users, only: [:show] do
    get :favorites, on: :collection
  end

end
