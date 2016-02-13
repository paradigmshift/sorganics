class CreatePigs < ActiveRecord::Migration
  def change
    create_table :pigs do |t|
      t.string :name
      t.datetime :birthdate
      t.float :weight_at_beginning
      t.float :cost
      t.string :cause_of_death
      t.integer :batch_id

      t.timestamps
    end
  end
end
