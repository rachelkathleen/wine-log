class UsersController < ApplicationController

  def new
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params)
    if @user.save
      #login the user
      session[:user_id] = @user.id
      redirect_to '/wines'
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name, :email, :password)
  end

end
