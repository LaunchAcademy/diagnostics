class AdminController < ApplicationController
  before_action :authorize_admin

  def authorize_admin
    if !current_user || !current_user.admin?
      flash[:alert] = 'Unauthorized.'
      redirect_to root_path
    end
  end
end
