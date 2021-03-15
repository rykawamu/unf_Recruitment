Rails.application.routes.draw do
  get 'sessions/new'
  resources :users

  get '/photolist', to: 'photos#show'
  get '/photoupload',   to: 'photos#new'
  post '/photoupload',   to: 'photos#create'
  resources :photos

  root 'static_pages#about'
  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
