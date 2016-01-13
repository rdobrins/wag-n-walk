class Dog < ActiveRecord::Base
  validates :name, presence: true
  validates :breed, presence: true
end
