class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.datetime :date_time
      t.integer :line_size

      t.timestamps
    end
  end
end
