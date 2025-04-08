# employees = [
#   { name: "John Doe", department: "Sales" },
#   { name: "Jane Doe", department: "Marketing" },
#   { name: "Bob Smith", department: "IT" },
#   { name: "Alice Johnson", department: "HR" },
#   { name: "Mike Brown", department: "Finance" },
# ]

# task_names = ["Setup email", "Create Slack account", "Sign NDA", "Meet team", "Review company policies"]

# employees.each do |employee|
#   Employee.create!(employee)
# end

# Employee.all.each do |employee|
#   task_names.sample(rand(3..5)).each do |task|
#     employee.onboarding_tasks.create!(task_name: task, status: ["pending", "completed"].sample)
#   end
# end

