class OnboardingTasksController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :update]

    def index
        @employees = Employee.all
        if params[:department].present?
          @employees = @employees.where(department: params[:department])
        end
    
        if params[:status].present?
          @employees = @employees.joins(:onboarding_tasks).where(onboarding_tasks: { status: params[:status] })
        end
      end
    
      def update
        task = OnboardingTask.find(params[:id])
        task.update(status: 'completed')
        redirect_to root_path, notice: 'Task marked as completed.'
      end
    
end
