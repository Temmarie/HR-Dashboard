class Admin::DashboardController < ApplicationController
  include Authentication
  before_action :authenticate_admin!

  def index
    
    @employees = Employee.includes(:user)
    @tasks = OnboardingTask.all
    @departments = Department.all

  
    if params[:status].present?
      @tasks = @tasks.where(status: params[:status])
      @employees = @employees.joins(:onboarding_tasks).where(onboarding_tasks: { status: params[:status] })
    end

    if params[:department].present?
      @employees = @employees.where(department: params[:department])
      @tasks = @tasks.joins(:employee).where(employees: { department: params[:department] })
    end
  end

  def assign_task
    @employees = Employee.all
    @departments = Department.all
    @task = OnboardingTask.new
  end

  def create_task
    @task = OnboardingTask.new(task_params)
    if @task.save
      redirect_to admin_dashboard_path, notice: "Task assigned successfully!"
    else
      render :assign_task, alert: "Error assigning task"
    end
  end

  private

  def task_params
    params.require(:onboarding_task).permit(:task_name, :status, :employee_id)
  end
end