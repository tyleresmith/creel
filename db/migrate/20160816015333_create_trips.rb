class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :location
      t.datetime :date
      t.integer :user_id
      t.string :state
      t.string :city
      t.string :water_type
      t.string :body_type

      t.timestamps null: false
    end
  end
end
