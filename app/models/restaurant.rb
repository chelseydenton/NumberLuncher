class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :observations

	def self.average_on(date, id)
		@temp_obs = Observation.where("date(date_time) = ? AND restaurant_id = ?", date, id)
		if @temp_obs.nil?
			0
		else
			@temp_obs.average(:line_size)
		end
	end
end
