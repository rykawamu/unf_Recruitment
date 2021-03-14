Rails.application.routes.draw do
  get 'sessions/new'
  resources :users

  get '/photolist', to: 'static_pages#about'

  root 'static_pages#about'
  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
