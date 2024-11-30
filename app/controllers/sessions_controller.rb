class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tasks_path, notice: "User was successfully logged in."
    else
      flash[:alert] = "Invalid username or password."
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "User was successfully logged out."
  end
end
