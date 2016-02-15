class Weight < ActiveRecord::Base
  belongs_to :pig

  validates :date, presence: true
  validates :weight, presence: true
  validates :pig_id, presence: true
end
