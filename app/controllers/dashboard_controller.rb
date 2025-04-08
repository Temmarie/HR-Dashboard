class DashboardController < ApplicationController
 allow_unauthenticated_access only: [:home]
  before_action :require_authentication, except: [:home]


  def index
    @employees = Employee.includes(:onboarding_tasks)

    if params[:status].present?
      @employees = @employees.where(onboarding_tasks: { status: params[:status] })
    end

    if params[:department].present?
      @employees = @employees.where(department: params[:department])
    end
  end

  def home
    redirect_to dashboard_path if authenticated?
  end
end
