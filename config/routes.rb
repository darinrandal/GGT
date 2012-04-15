GGT::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'statics#home'

  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
end