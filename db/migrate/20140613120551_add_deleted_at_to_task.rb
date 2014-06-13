class AddDeletedAtToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :deleted_at, :timestamp
  end
end
