class Walk < ActiveRecord::Base
  validates :date, presence: true
  validates :capacity, presence: true
  validates :capacity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 15
  }
end
