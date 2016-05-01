class IncomingInventory < ActiveRecord::Base
  belongs_to :feed_type

  validates :feed_type_id, presence: true
  validates :date, presence: true
  validates :quantity, presence: true

end
