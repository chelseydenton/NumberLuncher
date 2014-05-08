class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end

    add_index :relationships, :restaurant_id
    add_index :relationships, :user_id
    add_index :relationships, [:restaurant_id, :user_id], unique: true

  end
end
