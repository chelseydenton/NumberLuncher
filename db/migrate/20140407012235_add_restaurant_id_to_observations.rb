class AddRestaurantIdToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :restaurant_id, :integer
  end
end
