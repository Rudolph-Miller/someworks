class CreateAddAssigednTaskIdToArticles < ActiveRecord::Migration
  def change
    create_table :add_assigedn_task_id_to_articles do |t|
      t.integer :assigned_task_id

      t.timestamps
    end
  end
end
