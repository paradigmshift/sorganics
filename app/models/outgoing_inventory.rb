class OutgoingInventory < ActiveRecord::Base
  belongs_to :feed_type
  belongs_to :batch

  validates :batch_id, presence: true
  validates :feed_type_id, presence: true
  validates :date, presence: true
  validates :quantity, presence: true

  validate :prevent_negative_inventory, on: :create

  def prevent_negative_inventory
    errors.add(:quantity, "can't go below 0") if FeedType.find(feed_type_id).last_phys_inventory.quantity - quantity < 0
  end
end
