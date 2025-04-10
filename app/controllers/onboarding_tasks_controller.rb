class OnboardingTasksController < ApplicationController
  before_action :authenticate_admin!

  def index
    if current_user.admin?
      @employees = Employee.includes(:onboarding_tasks)
      @employees = @employees.where(department: params[:department]) if params[:department].present?
      @employees = @employees.joins(:onboarding_tasks).where(onboarding_tasks: { status: params[:status] }) if params[:status].present?
    else
      @employees = [current_user.employee]
    end
  end

  def update
    task = OnboardingTask.find(params[:id])
    puts params.inspect
    if current_user.admin? || task.employee.user == current_user
      task.update(status: 'completed')
      redirect_to root_path, notice: 'Task marked as completed.'
    else
      redirect_to root_path, alert: 'Access denied.'
    end
  end

# def update
#   puts "Params: #{params.inspect}"  
#   task = OnboardingTask.find(params[:id])
#   if task.update(status: 'completed')
#     redirect_to root_path, notice: 'Task marked as completed.'
#   else
#     redirect_to root_path, alert: 'Failed to mark task as completed.'
#   end
# end

end
