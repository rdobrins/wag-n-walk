class Membership < ActiveRecord::Base
  belongs_to :dog
  belongs_to :walk

  validates :dog_id, presence: true
  validates :walk_id, presence: true
end
