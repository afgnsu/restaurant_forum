Rails.application.routes.draw do
  
  devise_for :users

  root "restaurants#index"

  resources :restaurants, only: [:index, :show] do

    resources :comments, only: [:create, :destroy]
    
    collection do
      get :feeds  
    end

    collection  do
      get :ranking
    end

    member do
      get :dashboard
    end

    member do
      post :favorite
      post :unfavorite
    end

    member do
      post :like
      post :unlike
    end

  end

  resources :categories, only: :show

  resources :users, only: [:index, :show, :edit, :update]

  resources :followships, only: [:create, :destroy]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
