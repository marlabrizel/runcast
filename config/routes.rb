Rails.application.routes.draw do
  require 'sidekiq/web'
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV["SIDEKIQ_USERNAME"] && password == ENV["SIDEKIQ_PASSWORD"]
  end if Rails.env.production?
  mount Sidekiq::Web, at: "/sidekiq"

  root 'welcome#index'
  get '/auth/strava/callback', to: 'sessions#create'
  get '/loading', to:'sessions#loading'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'segments#show'
  get '/dashboard/find', to: 'segments#find'
end
