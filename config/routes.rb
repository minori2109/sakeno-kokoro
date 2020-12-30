Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :items, only: [:index, :show]
    namespace :admin do
      resources :items, only: [:index, :new, :create, :edit, :update]
    end
end
