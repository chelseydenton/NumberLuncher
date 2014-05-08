class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :observations
  has_many :relationships, foreign_key: "restaurant_id",
    class_name: 'Relationship',
    dependent: :destroy
  has_many :users, through: :relationships, source: :user


end
