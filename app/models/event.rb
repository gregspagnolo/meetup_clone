class Event < ActiveRecord::Base
  belongs_to :user
  validates :name, :date, :city, :state, presence: true
  has_many :comments
  has_many :plans
  has_many :users_joined, through: :plans, source: :user
end
