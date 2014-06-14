class AddEditorIdToAssignedTask < ActiveRecord::Migration
  def change
    add_column :assigned_tasks, :editor_id, :integer
  end
end
