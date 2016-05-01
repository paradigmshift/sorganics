class CreateIncomingInventories < ActiveRecord::Migration
  def change
    create_table :incoming_inventories do |t|
      t.datetime :date
      t.integer :quantity
      t.integer :feed_type_id

      t.timestamps
    end
  end
end
