Rails.application.routes.draw do
root 'users#index'

post '/login', to: 'sessions#create'
get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/show', to: 'projects#index'
post '/logout' to: 'sessions#destroy'

resources :users do
  resources :projects, only: [:index, :show, :new, :edit]
end
resources :projects
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
