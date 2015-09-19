Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/strava/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'dashboard#show'
end
