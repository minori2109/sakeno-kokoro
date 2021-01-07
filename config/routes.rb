Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :items, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
    namespace :admin do
      resources :items
    end
end
