class Dog < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :breed, presence: true
  validates :user_id, presence: true
  mount_uploader :avatar, AvatarUploader
end
