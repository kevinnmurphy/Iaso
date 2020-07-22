Rails.application.routes.draw do
  resources :foodlogs
  resources :entries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  resources :foods
  resources :meals
  resources :foodlogs, only: %i[create update delete]
  resources :users, only: %i[new create show update] do 
    resources :meals, only: %i[index show]
  end

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get  '/auth/:provider/callback', to: 'sessions#omniauth'

end