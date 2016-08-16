class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :common_name
      t.string :species_name
      t.integer :length
      t.integer :weight
      t.string :location
      t.string :tackle
      t.integer :trip_id

      t.timestamps null: false
    end
  end
end
