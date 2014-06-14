class AddTaskCreatableTypeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_creatable_type, :string
  end
end
