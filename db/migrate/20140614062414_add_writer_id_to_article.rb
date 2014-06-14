class AddWriterIdToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :writer_id, :integer
  end
end
