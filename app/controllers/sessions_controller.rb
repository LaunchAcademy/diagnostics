class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_via_omniauth(auth)
    session[:user_id] = user.id
    flash[:success] = "Signed in!"
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Signed out!"
    redirect_to root_path
  end
end
