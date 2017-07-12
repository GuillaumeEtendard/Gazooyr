Rails.application.routes.draw do
  resources :profiles do
    resources :follow, only: [:create, :destroy]
    resources :followees, only: [:index]
    resources :followers, only: [:index]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home
  resources :posts
  root 'home#index'

  resources :gazooies

  resources :hash_tags

  authenticate :user do
    resources :news, only: [:new, :create, :edit, :update, :destroy], :shallow => true do
      resources :comments, only: [:create, :update, :destroy]
    end
    resources :pages, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :news, only: [:index, :show]
  resources :pages, only: [:index, :show]


end
