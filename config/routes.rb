Rails.application.routes.draw do
  resources :meals
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :users, only: %i[new create show update]
  resources :foods
  resources :meals

  resources :meals do
    resources :foods
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

end