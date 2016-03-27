class Inventory < ActiveRecord::Base
  belongs_to :feed_type

  validates :date,:quantity, presence: true
end
