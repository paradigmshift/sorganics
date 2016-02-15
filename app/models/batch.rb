class Batch < ActiveRecord::Base
  has_many :pigs

  validates :name, presence: true
  validates :date, presence: true

end
