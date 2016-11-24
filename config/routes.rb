Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'quotes#index'
  get 'tags/:tag', to:'quotes#index', as: :tag
  
  resources :quotes  
  
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
