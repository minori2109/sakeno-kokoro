Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :create]
  end
  post 'favorites/:id' => 'favorites#create', as: 'create_favorites'
  delete 'favorites/:id' => 'favorites#destroy', as: 'destroy_favorites'

  namespace :admin do
    resources :items
  end

  resources :reviews, only: [:show]
  resources :users, only: [:show] do
    get :favorites, on: :collection
  end

end
