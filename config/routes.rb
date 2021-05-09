Rails.application.routes.draw do

  root 'sessions#new'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'

  resources :races do 
    resources :user_races, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:index, :show, :update, :edit, :destroy] do 
    resources :races, only: [:index, :show]
  end

end
