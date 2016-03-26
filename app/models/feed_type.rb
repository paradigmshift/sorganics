class FeedType < ActiveRecord::Base
  validates :variety, presence: true
  has_many :inventories
end
