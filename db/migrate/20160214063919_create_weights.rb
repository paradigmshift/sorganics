class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.datetime :date
      t.float :weight
      t.integer :pig_id

      t.timestamps
    end
  end
end
