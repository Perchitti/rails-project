Rails.application.routes.draw do
root 'users#index'

post '/login', to: 'sessions#create'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/show', to: 'users#show'
get '/project/show', to: 'projects#new'
post '/project/new', to: 'projects#show'
#get '/projects/new', to: 'projects#new'
#post '/projects/new', to: 'projects#show'
post '/logout', to: 'sessions#destroy'


resources :projects
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
