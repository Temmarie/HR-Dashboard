class RegistrationsController < ApplicationController
  allow_unauthenticated_access
  before_action :require_admin, except: [:new, :create] # don't block public sign-up

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params.except(:name, :department))
  
    if @user.save
      if @user.role == "employee"
        Employee.create!(name: user_params[:name], department: user_params[:department], user: @user)
      end
  
      start_new_session_for(@user)
      redirect_to after_authentication_url, notice: "Account created successfully. Welcome to the app!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :name, :department)
  end

  def require_admin
    unless Current.user&.admin?
      redirect_to root_path, alert: "Access denied."
    end
  end
end
