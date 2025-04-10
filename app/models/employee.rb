class Employee < ApplicationRecord
    has_many :onboarding_tasks, dependent: :destroy
     belongs_to :user

     validates :name, presence: true


def admin?
    role == "admin"
  end
end
