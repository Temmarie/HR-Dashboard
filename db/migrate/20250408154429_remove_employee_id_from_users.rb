class RemoveEmployeeIdFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :employee_id, :integer
  end
end
