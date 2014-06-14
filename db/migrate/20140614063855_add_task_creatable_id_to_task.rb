class AddTaskCreatableIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :task_creatable_id, :integer
  end
end
