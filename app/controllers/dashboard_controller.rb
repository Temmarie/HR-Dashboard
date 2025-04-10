class DashboardController < ApplicationController
  allow_unauthenticated_access only: [ :home ]
  before_action :require_authentication, except: [ :home ]

  # def index
  #   if Current.user.admin?
  #     # view all employees
  #     @employees = Employee.includes(:onboarding_tasks)


  #     if params[:status].present?
  #       @employees = @employees.where(onboarding_tasks: { status: params[:status] })
  #     end

  #     # Filter by department
  #     if params[:department].present?
  #       @employees = @employees.where(department: params[:department])
  #     end

  #     # Fetch all tasks for admins
  #     @tasks = OnboardingTask.all
  #   else
  #     # Employees task view
  #     @tasks = Current.user.employee.onboarding_tasks
  #   end

  #   @onboarding_task = OnboardingTask.new
  # end



  def index
    if Current.user.admin?
      # view all employees
      @employees = Employee.includes(:onboarding_tasks).joins(:onboarding_tasks)
      if params[:status].present?
        @employees = @employees.where(onboarding_tasks: { status: params[:status] })
      end
      # Filter by department
      if params[:department].present?
        @employees = @employees.where(department: params[:department])
      end
      # Fetch all tasks for admins
      @tasks = OnboardingTask.all
    else
      # Employees task view
      if params[:status].present?
        @tasks = Current.user.employee.onboarding_tasks.where(status: params[:status])
      else
        @tasks = Current.user.employee.onboarding_tasks
      end
    end
    @onboarding_task = OnboardingTask.new
  end





  def home
    redirect_to dashboard_path if authenticated?
  end
end
