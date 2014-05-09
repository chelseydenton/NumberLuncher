class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :observations

	def self.PastDaysObservations(id)

	    observations_array = []
	    Observation.where("date_time > ? AND restaurant_id = ?", DateTime.now - 1, id).order("date_time").reverse_order.each do |obs|
	    	tmp_array = []
	    	tmp_array.push(obs.date_time.to_i*1000)
	    	tmp_array.push(obs.line_size)
	        observations_array.push(tmp_array)
	    end

	    return observations_array
	end
end
