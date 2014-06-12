class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.references :websites, index: true
      t.integer :number
      t.integer :reward
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
