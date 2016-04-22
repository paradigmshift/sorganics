class FeedType < ActiveRecord::Base
  validates :variety, presence: true
  has_many :inventories
  has_many :outgoing_inventories

  def last_phys_inventory
    Inventory.where(variety: self.variety).last
  end

  def outgoing_inventory
    outgoing_quantity = OutgoingInventory.where('date BETWEEN ? AND ?', self.last_phys_inventory.date, DateTime.now.end_of_day).where(:variety => self.variety).inject(0) do |memo, inventory| 
      memo + inventory.quantity
    end

  end
end
