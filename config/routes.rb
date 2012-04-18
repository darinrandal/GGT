GGT::Application.routes.draw do
  resources :users
  resources :posts
  resources :events
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'posts#index'

  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
end