class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
	has_many :observations
end
