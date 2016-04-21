class Pig < ActiveRecord::Base
  belongs_to :batch
  has_many :weights

  validates :name, presence: true
  validates :birthdate, presence: true
  validates :weight_at_beginning, presence: true

end
