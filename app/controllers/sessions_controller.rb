class SessionsController < ApplicationController
  def create
    user = User.find_or_create_from_auth(oauth_data)
    if user
      session[:user_id] = user.id
      StravaWorker.perform_async(user.id)
      user.processing!
      redirect_to loading_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def loading
    unless current_user.processing?
      redirect_to dashboard_path
    end
  end

  private

  def oauth_data
    request.env['omniauth.auth']
  end
end
