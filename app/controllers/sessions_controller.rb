class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :welcome]
  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def welcome
  end

  #logout
  def destroy
    session.clear
    redirect_to '/goodbye'
  end


end
