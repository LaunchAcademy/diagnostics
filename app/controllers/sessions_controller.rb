class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    user = User.find_or_create_via_omniauth(auth)

    if user
      session[:user_id] = user.id
      flash[:success] = "Signed in!"
      redirect_to session[:return_to] || quizzes_path
    else
      flash[:alert] = "Error signing in!"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Signed out!"
    redirect_to root_path
  end
end
