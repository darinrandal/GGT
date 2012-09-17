GGT::Application.routes.draw do
  resources :users, :posts
  resources :events, only: :index
  resources :avatars, only: [:edit, :update]
  resources :sessions, only: [:new, :create, :destroy]

  root :to => 'posts#index'

  match '/register', to: 'users#new'
  match '/login', to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/usercp', to: 'avatars#edit'

  match '/users/:id/events' => 'events#user_events'
end