Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/strava/callback', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'segments#show'
  get '/dashboard/find', to: 'segments#find'

  # resources :segments, only: [:show], as: 'dashboard' do
  #   collection do
  #     post 'find'
  #   end
  # end
end
