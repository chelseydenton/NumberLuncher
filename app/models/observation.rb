class Observation < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
  validates :restaurant_id, presence: true
  validates :user_id, presence: true
  validates :line_size, presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  default_scope -> { order('created_at DESC') }
end
