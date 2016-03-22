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
    # resource :cart, only: :add_to_cart, controller: 'carts'
    collection do
      post 'add_to_cart', to: "carts#add_to_cart"
    end

    collection do
      post 'delete_from_cart', to: "carts#delete_from_cart"
    end

  end

  resources :orders

end
