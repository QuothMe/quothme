Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'quotes#index'
  get 'tags/:tag', to:'quotes#index', as: :tag
  
  resources :quotes   

  namespace :admin do
    resources :quotes, only:[:new, :create]
  end


  resources :users, only:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
