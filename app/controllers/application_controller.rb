class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  protected
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize_user
    unless current_user
      flash[:warning] = 'Please, sign in first.'
      redirect_to root_path
    end
  end

  def authorize_admin
    if !current_user || !current_user.admin?
      flash[:alert] = 'Unauthorized.'
      redirect_to root_path
    end
  end
end
