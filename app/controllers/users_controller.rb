class UsersController < ApplicationController

  before_action :authorize, only: :index

  before_action :session_created, only: [:new, :create]

  def index
    @books = Book.order(:title).includes(:photo).page(params[:page] || 1)
  end

  def new
    @user ||= User.new
  end

  def create
    @user ||= User.new(registration_params)
    return redirect_to(login_path) if @user.save
    render :new
  end

  private

  def registration_params
    params.require(:user)
          .permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
