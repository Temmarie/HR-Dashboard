# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


employees = [
  { name: "John Doe", department: "Sales" },
  { name: "Jane Doe", department: "Marketing" },
  { name: "Bob Smith", department: "IT" },
  { name: "Alice Johnson", department: "HR" },
  { name: "Mike Brown", department: "Finance" },
]

employees.each do |employee|
  Employee.create!(employee)
end

Employee.all.each do |employee|
  3.times do
    OnboardingTask.create!(employee: employee, task_name: "Task #{rand(1..100)}")
  end
end

  