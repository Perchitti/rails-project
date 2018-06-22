Rails.application.routes.draw do
root 'users#index'

post '/login', to: 'sessions#create'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/show', to: 'users#show'
post '/logout', to: 'sessions#destroy'


resources :projects
resources :users
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
