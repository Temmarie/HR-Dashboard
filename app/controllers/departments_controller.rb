class DepartmentsController < ApplicationController
    before_action :require_admin
  
    def index
      @departments = Department.all
    end
  
    def new
      @department = Department.new
    end
  
    def create
      @department = Department.new(department_params)
      if @department.save
        redirect_to departments_path, notice: "Department created."
      else
        render :new
      end
    end
  
    private
  
    def department_params
      params.require(:department).permit(:name)
    end
  end
  