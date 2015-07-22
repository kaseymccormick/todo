class User < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end