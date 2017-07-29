class ApplicationController < ActionController::Base
  include ApplicationHelper
  include ViewsHelper

  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_path unless current_user
  end

  def session_created
    redirect_to root_path if current_user
  end
end
