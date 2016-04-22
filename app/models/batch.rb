class Batch < ActiveRecord::Base
  has_many :pigs
  has_many :outgoing_inventories

  validates :name, presence: true
  validates :date, presence: true

end
