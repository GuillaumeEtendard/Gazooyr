Rails.application.routes.draw do
  resources :profiles, only: [:show, :edit, :update] do
    post 'follow/:user_id', :to => "profiles#follow", :as => 'follow'
    delete 'unfollow/:user_id', :to => "profiles#unfollow", :as => 'unfollow'
    get :followees
    get :followers
    get :mentions
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :home
  resources :posts
  root 'home#index'

  resources :gazooies, only: [:index, :show, :create]

  resources :hash_tags, only: [:show]

  get "/about", :to => "pages#show", :id => "about", :as => :about
  get "/super-page", :to => "pages#show", :id => "super-page", :as => :superpage


  resources :news, only: [:new, :create, :edit, :update, :destroy], :shallow => true do
    resources :comments, only: [:create]
  end
  post "/comments", :to => "comments#create", :as => :comments_creation_alias
  resources :news, only: [:index, :show]
  resources :pages, except: [:index]


end
