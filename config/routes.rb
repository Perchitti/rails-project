Rails.application.routes.draw do
root 'users#index'

resources :projects
resources :users
get '/', to: 'users#index', as: 'login'
 get '/logout', to: 'sessions#destroy', as: 'logout'
get 'auth/google_oauth2/callback', to: 'sessions#create'
post '/login', to: 'sessions#login'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/show', to: 'users#show'
post '/logout', to: 'sessions#destroy'
delete '/logout', to: 'sessions#destroy'





end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
