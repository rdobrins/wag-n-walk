class User < ActiveRecord::Base
  has_many :dogs
  has_many :walks

  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true
  validates :zip, length: { is: 5 }
  validates :zip, numericality: { only_integer: true }
  validates :phone_number, length: { is: 10 }
  validates :phone_number, numericality: { only_integer: true }
  mount_uploader :avatar, AvatarUploader
end
