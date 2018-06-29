Rails.application.routes.draw do
root 'users#index'

#get '/login', to: redirect('/auth/google_oauth2'), as: 'login'
 get 'logout', to: 'sessions#destroy', as: 'logout'
get 'auth/google_oauth2/callback', to: 'sessions#create'
post '/login', to: 'sessions#login'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/show', to: 'users#show'
post '/logout', to: 'sessions#destroy'


resources :projects
resources :users
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
