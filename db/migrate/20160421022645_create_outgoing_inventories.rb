class CreateOutgoingInventories < ActiveRecord::Migration
  def change
    create_table :outgoing_inventories do |t|
      t.datetime :date
      t.string :variety
      t.integer :quantity
      t.integer :batch_id
      t.integer :feed_type_id
    end
  end
end
