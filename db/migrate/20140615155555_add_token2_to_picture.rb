class AddToken2ToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :token2, :integer, :limit => 8
  end
end
