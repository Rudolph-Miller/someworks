class AddDeletedAtToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :deleted_at, :timestamp
  end
end
