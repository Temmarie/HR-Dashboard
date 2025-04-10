departments = [
  "Engineering",
  "Human Resources",
  "Marketing",
  "Sales",
  "Product",
  "Customer Success"
]

# Seed Departments
departments.each do |dept|
  Department.find_or_create_by!(name: dept)
end

# Create Admin User
admin = User.create!(
  email_address: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)


employee_names = [
  "Alice Johnson",
  "Michael Lee",
  "Sophia Ramirez",
  "David Kim",
  "Emily Chen"
]


employee_names.each_with_index do |full_name, i|
  user = User.create!(
    email_address: full_name.parameterize(separator: ".") + "@example.com",
    password: "password123",
    password_confirmation: "password123",
    role: "employee"
  )

  Employee.create!(
    name: full_name,
    department: Department.all.sample.name,
    user: user
  )
end

task_names = [
  "Submit ID Documents",
  "Complete Payroll Setup",
  "Attend Orientation",
  "Meet Your Team Lead",
  "Setup Company Email",
  "Read Company Handbook"
]

# Assign 3 random onboarding tasks to each employee
Employee.all.each do |employee|
  task_names.sample(3).each do |task|
    OnboardingTask.create!(
      employee: employee,
      task_name: task,
      status: "pending"
    )
  end
end




