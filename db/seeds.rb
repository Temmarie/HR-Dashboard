
departments = [
  "Engineering",
  "Human Resources",
  "Marketing",
  "Sales",
  "Product",
  "Customer Success"
]

departments.each do |dept|
  Department.find_or_create_by!(name: dept)
end

# Create Admin
admin = User.create!(
  email_address: "admin@example.com",
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)

# Create Employees
5.times do |i|
  user = User.create!(
    email_address: "employee#{i + 1}@example.com",
    password: "password123",
    password_confirmation: "password123",
    role: "employee"
  )

  Employee.create!(
    name: "Employee #{i + 1}",
    department: Department.all.sample.name,
    user: user
  )
end
