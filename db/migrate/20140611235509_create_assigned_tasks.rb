class CreateAssignedTasks < ActiveRecord::Migration
  def change
    create_table :assigned_tasks do |t|
      t.references :tasks, index: true

      t.timestamps
    end
  end
end
