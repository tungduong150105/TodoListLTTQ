class UsersController < ApplicationController
  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to tasks_path, notice: "User was successfully created."
    else
      render :new
    end
  end
  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
