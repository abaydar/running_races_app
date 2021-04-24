Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :races
  resources :users, only: [:index, :show, :update, :edit, :destroy] do 
    resources :races, only: [:index, :show, :new, :create]
  end

end
