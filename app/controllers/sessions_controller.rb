class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :welcome, :login, :fb_create]
  
  def new
    @user = User.new
    render :login
  end

  def create
    @user = User.find_or_create_by(user_name: params[:user][:user_name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def fb_create
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.user_name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'welcome'
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
