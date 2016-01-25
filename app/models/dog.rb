class Dog < ActiveRecord::Base
  belongs_to :user
  has_many :memberships
  has_many :walks, through: :memberships

  validates :name, presence: true
  validates :breed, presence: true
  validates :body, length: { maximum: 180 }
  validates :user_id, presence: true
  mount_uploader :avatar, AvatarUploader
end
