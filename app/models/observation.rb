class Observation < ActiveRecord::Base
	belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :line_size, presence: true
end
