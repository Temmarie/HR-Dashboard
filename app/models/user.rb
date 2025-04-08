class User < ApplicationRecord
  has_one :employee, dependent: :destroy

  has_secure_password

  ROLES = %w[employee admin].freeze

  has_many :sessions, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ROLES }

  before_validation :normalize_email

  def normalize_email
    self.email_address = email_address.strip.downcase if email_address.present?
  end

  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end

  before_validation :set_default_role, on: :create

def set_default_role
  self.role ||= "employee"
end

end
