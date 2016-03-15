Rails.application.routes.draw do
  devise_for :users

  root 'meals#index'

  resources :users do
    ressources :profiles
  end

  ressources :restaurants do
    ressources :meals, only: [:new, :create, :update, :edit, :destroy]
  end

  resources :meals, only [:index, :show] do
    ressources :reviews
  end

  ressources :orders

end
