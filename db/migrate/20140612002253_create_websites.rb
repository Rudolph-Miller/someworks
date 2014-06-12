class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :site_type
      t.string :url
      t.string :name

      t.timestamps
    end
  end
end
