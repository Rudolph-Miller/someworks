class AddToken1ToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :token1, :integer, :limit => 8
  end
end
