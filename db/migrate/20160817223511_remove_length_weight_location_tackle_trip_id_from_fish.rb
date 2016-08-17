class RemoveLengthWeightLocationTackleTripIdFromFish < ActiveRecord::Migration
  def up
    remove_column :fish, :length
    remove_column :fish, :weight
    remove_column :fish, :location
    remove_column :fish, :tackle
    remove_column :fish, :trip_id
  end
  
  def down
    add_column :fish, :length
    add_column :fish, :weight
    add_column :fish, :location
    add_column :fish, :tackle
    add_column :fish, :trip_id 
  end
end
