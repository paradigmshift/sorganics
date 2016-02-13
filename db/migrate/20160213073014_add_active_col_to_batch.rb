class AddActiveColToBatch < ActiveRecord::Migration
  def change
    add_column :batches, :active, :boolean
  end
end
