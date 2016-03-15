Rails.application.routes.draw do
  devise_for :users

  root 'meals#index'

  resources :users do
    resources :profiles
  end

  resources :restaurants do
    resources :meals, only: [:new, :create, :update, :edit, :destroy]
  end

  resources :meals, only: [:index, :show] do
    resources :reviews
  end

  resources :orders

end
