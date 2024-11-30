class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_current_user, except: [:new, :create]
  def set_current_user
    if session[:user_id]
      Current.user = User.find(session[:user_id])
    else
      redirect_to new_session_path, notice: "Please log in."
    end
  end
end
