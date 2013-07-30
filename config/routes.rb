WdiTradr::Application.routes.draw do

  root :to => 'users#index'
  resources :user_sessions
  resources :users
  resources :stocks


  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
  post 'create_stock' => 'stocks#create', :as => 'create_stocks'
end
