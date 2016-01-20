class Walk < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :dogs, through: :memberships
  
  validates :date, presence: true
  validates :capacity, presence: true
  validates :capacity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10
  }
end
