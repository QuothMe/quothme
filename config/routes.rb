Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                    as: :link_through

  devise_for :admins, :skip => [:registrations]
  devise_for :users, :controllers => {:omniauth_callbacks => "users/omniauth_callbacks"}
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'tags/:tag', to:'quotes#index', as: :tag


  authenticated :user do
    root :to => 'quotes#index', as: :authenticated
  end

  root :to=> 'pages#home'


  resources :quotes do
    resources :comments
    member do
      get 'like'
      get 'unlike'
    end
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
