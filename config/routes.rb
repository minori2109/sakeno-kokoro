Rails.application.routes.draw do
  get 'reviews/new'
  root 'home#index'
  devise_for :users
  resources :items, only: [:index, :show] do
    resources :review
  end
    namespace :admin do
      resources :items
    end
end
