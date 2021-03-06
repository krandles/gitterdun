Rails.application.routes.draw do
  root 'dashboard#index'
  resources :categories
  resources :tasks
  resources :projects
  resources :users
  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#new'
  post '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create', as: 'login_path'
  get '/analytics', to: 'analytics#index'
  match "*path", to: redirect('/404'), via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
