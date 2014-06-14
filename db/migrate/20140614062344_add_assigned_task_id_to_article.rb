class AddAssignedTaskIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :assigned_task_id, :integer
  end
end
