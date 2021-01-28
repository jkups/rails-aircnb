class ApplicationController < ActionController::Base

  before_action :fetch_user

  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end

    session[:user_id] = nil unless @current_user.present?
  end

  def check_if_user_logged_in
    unless @current_user.present? && !@current_user.admin
      flash[:error] = 'You are not authorized to perform that action.'
      redirect_to login_path
    end
  end

  def check_if_admin_logged_in
    unless @current_user.present? && @current_user.admin
      session[:user_id] = nil
      flash[:error] = 'Your account cannot perform that action.'
      redirect_to login_path
    end
  end

end
