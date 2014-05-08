class Relationship < ActiveRecord::Base
    belongs_to :restaurant, class_name: 'Restaurant'
    belongs_to :user, class_name: 'User'
end
