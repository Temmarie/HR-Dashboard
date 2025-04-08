class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!

  def index
    @employees = Employee.includes(:user).all
    @departments = Department.all
    @tasks = OnboardingTask.all
  end
end
