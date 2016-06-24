class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, :email, :city, :state, presence: true
  has_many :comments
  has_many :events
  has_many :plans, through: :events
end
