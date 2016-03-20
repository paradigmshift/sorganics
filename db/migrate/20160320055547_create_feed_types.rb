class CreateFeedTypes < ActiveRecord::Migration
  def change
    create_table :feed_types do |t|
      t.string :variety

      t.timestamps
    end
  end
end
