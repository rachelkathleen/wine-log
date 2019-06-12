class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_or_create_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to home_path
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def fb_create
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end


  def googleAuth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end

  def welcome
  end

  #logout
  def destroy
    session.clear
    redirect_to '/goodbye'
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
