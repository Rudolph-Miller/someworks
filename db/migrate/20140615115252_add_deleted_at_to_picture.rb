class AddDeletedAtToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :deleted_at, :timestamp
  end
end
