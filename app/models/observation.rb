class Observation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
  validates :restaurant_id, presence: true
  validates :line_size, presence: true
  #validates :user_id, presence: true
end
