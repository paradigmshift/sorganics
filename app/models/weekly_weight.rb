class WeeklyWeight < ActiveRecord::Base
  belongs_to :pig

  validates :date, presence: true
  validates :weight, presence: true

end
