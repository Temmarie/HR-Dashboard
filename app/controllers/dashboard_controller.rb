class DashboardController < ApplicationController
  allow_unauthenticated_access only: [:home]
  before_action :require_authentication, except: [:home]

  def index
    if Current.user.admin?
      # Admins can view all employees and their tasks
      @employees = Employee.includes(:onboarding_tasks)

      # Filter by task status if provided
      if params[:status].present?
        @employees = @employees.where(onboarding_tasks: { status: params[:status] })
      end

      # Filter by department if provided
      if params[:department].present?
        @employees = @employees.where(department: params[:department])
      end

      # Fetch all tasks for admins
      @tasks = OnboardingTask.all
    else
      # Employees can only view their own tasks through the associated employee record
      @tasks = Current.user.employee.onboarding_tasks
    end

    @onboarding_task = OnboardingTask.new
  end

  def home
    redirect_to dashboard_path if authenticated?
  end
end