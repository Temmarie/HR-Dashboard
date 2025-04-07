class Employee < ApplicationRecord
    has_many :onboarding_tasks, dependent: :destroy
    # belongs_to :department
    
    # validates :name, presence: true
    # validates :email, presence: true, uniqueness: true
    # validates :department_id, presence: true
    
    # def onboarding_status
    #     onboarding_tasks.where(status: 'incomplete').count == 0 ? 'complete' : 'incomplete'
    # end
end
