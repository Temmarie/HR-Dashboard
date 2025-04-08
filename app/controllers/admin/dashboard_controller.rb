class Admin::DashboardController < ApplicationController
  include Authentication
  before_action :authenticate_admin!
  def index
    Rails.logger.debug "✅ Admin dashboard index reached!"
    @employees = Employee.includes(:user).all
    @departments = Department.all
    @tasks = OnboardingTask.all
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
