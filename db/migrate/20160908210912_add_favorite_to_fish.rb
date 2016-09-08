class AddFavoriteToFish < ActiveRecord::Migration
  def change
    add_column :fish, :favorite, :boolean, :default => false
  end
end
