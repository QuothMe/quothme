Rails.application.routes.draw do
  devise_for :users

  root 'quotes#index'
  get 'tags/:tag', to:'quotes#index', as: :tag
  resources :quotes   



  resources :users, only:[:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
