Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :users, only: %i[new create show update]
  resources :foods
  resources :meals

  resources :users do
    resources :meals
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end