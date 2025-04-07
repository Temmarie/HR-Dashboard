class CreateOnboardingTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :onboarding_tasks do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :task_name
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
