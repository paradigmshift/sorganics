class FeedType < ActiveRecord::Base
  validates :variety, presence: true
end
