Rails.application.routes.draw do

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '*path', controller: 'application', action: 'render_404'
  get '/error', controller: 'application', action: 'render_404'
  
  root to: 'tasks#index'
  resources :tasks

end