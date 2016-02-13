class Pig < ActiveRecord::Base
  belongs_to :batch
  has_many :weekly_weights

  validates :name, presence: true
  validates :weight_at_beginning, presence: true

end