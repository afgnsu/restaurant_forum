Rails.application.routes.draw do
  
  devise_for :users

  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do

    collection do
      get :feeds  
    end

    member do
      get :dashboard
    end

    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: :show

  resources :users, only: [:show, :edit, :update]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
