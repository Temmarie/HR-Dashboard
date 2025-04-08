class ApplicationController < ActionController::Base
  include Authentication
  
  helper_method :current_user, :admin?
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def current_user
    Current.user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_admin!
    unless Current.user&.role == "admin"
      redirect_to root_path, alert: "You are not authorized to access this page."
    end
  end

  def admin?
    Current.user&.role == "admin"
  end
end
