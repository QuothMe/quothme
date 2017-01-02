Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/facebook/callback', to: 'sessions#create'
  root 'quotes#index'
  get 'tags/:tag', to:'quotes#index', as: :tag
  
  resources :quotes do
    resources :comments
  end
  
  resources :users, only:[:show] do
    member do
      get :following, :followers
    end
  end

  resources :users_admin, :controller => 'users_admin'
  resources :admin, :controller => 'admins'

  namespace :api, path:'/', constraints: {subdomain: 'api'} do
    resources :quotes
  end
  resources :relationships, only: [:create, :destroy]
end
