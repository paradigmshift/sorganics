class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.datetime :date
      t.integer :quantity
      t.string :variety
      t.integer :feed_type_id

      t.timestamps
    end
  end
end
