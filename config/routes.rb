Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to 'sessions#destroy'

  resources :races, only: [:show, :index]
  resources :user_races, only: [:show, :new, :create]
  resources :comments, only: [:create, :update, :edit, :destroy]
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
