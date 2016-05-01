class FeedType < ActiveRecord::Base
  validates :variety, presence: true
  has_many :inventories
  has_many :outgoing_inventories
  has_many :incoming_inventories

  def last_phys_inventory
    if Inventory.where(variety: self.variety)
      Inventory.where(variety: self.variety).order(date: :desc).first
    else
      # create a new inventory entry with quantity 0 in the case that the last inventory entry was was deleted and is being queried
      Inventory.new(date: DateTime.new(2000,1,1), variety: self.variety, quantity: 0, feed_type_id: self.id)
    end
  end

  def outgoing_inventory
    outgoing_quantity = OutgoingInventory.where('date BETWEEN ? AND ?', self.last_phys_inventory.date, DateTime.now.end_of_day).where(:variety => self.variety).inject(0) do |memo, inventory| 
      memo + inventory.quantity
    end

  end

  def incoming_inventory
    incoming_quantity = IncomingInventory.where('date BETWEEN ? AND ?', self.last_phys_inventory.date, DateTime.now.end_of_day).where(:feed_type_id => self.id).inject(0) do |memo, inventory|
      memo + inventory.quantity
    end
  end

  def current_inventory
    self.last_phys_inventory.quantity - self.outgoing_inventory + self.incoming_inventory
  end
end
