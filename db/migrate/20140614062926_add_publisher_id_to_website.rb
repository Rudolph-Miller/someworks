class AddPublisherIdToWebsite < ActiveRecord::Migration
  def change
    add_column :websites, :publisher_id, :integer
  end
end
