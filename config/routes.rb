Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/strava/callback', to: 'sessions#create'
  get '/dashboard', to: 'dashboard#show'
end
