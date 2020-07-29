Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'sessions#home'

  resources :foods
  resources :meals do 
    resources :foods, only: [:new, :create]
    resources :foodlogs, only: [:edit, :update]
  end
  resources :foodlogs
  resources :users, only: %i[new create edit show update destroy] do 
    resources :meals, only: %i[index show]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/logout', to: 'sessions#destroy'
  # delete '/logout', to: 'sessions#destroy'

  # custom route for scoped items
  # get 'meals/fatty', to: 'meals#fatty', as: 'fatty_meal'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/auth/:provider/callback', to: 'sessions#omniauth'
 

end