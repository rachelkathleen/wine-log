class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    # normal create action
    @user = User.find_or_create_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def home
    @user = current_user
    unless logged_in?
      redirect_to home_path
    end
  end

  def insights
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password, :password_confirmation)
  end

end
