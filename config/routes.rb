Rails.application.routes.draw do

  get 'user_races/new'
  get 'user_races/edit'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  #omniauth path

  resources :races do 
    resources :user_races, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :users, only: [:index, :show, :update, :edit, :destroy] do 
    resources :races, only: [:index, :show]
  end

end
