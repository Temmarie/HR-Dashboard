class DashboardController < ApplicationController
  def index
    @employees = Employee.includes(:onboarding_tasks)

    if params[:status].present?
      @employees = @employees.where(onboarding_tasks: { status: params[:status] })
    end

    if params[:department].present?
      @employees = @employees.where(department: params[:department])
    end
  end
end
