class UsersController < ApplicationController

  before_filter :authorize, only: :index

  before_filter :session_created, only: [:new, :create]

  def index
  end

  def new
    @user ||= User.new
  end

  def create
    @user ||= User.new(registration_params)
    create_new @user, success: (proc do
                                  session[:user_id] = @user.id
                                  redirect_to login_path
                                end),
                      failure: (proc do
                                  render :new
                                end)
  end

  private

  def registration_params
    params.require(:user)
          .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
