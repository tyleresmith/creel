class CreateCatches < ActiveRecord::Migration
  def change
    create_table :catches do |t|
      t.integer :trip_id
      t.integer :fish_id
      t.integer :length
      t.integer :weight
      t.string :tackle
      t.string :location

      t.timestamps null: false
    end
  end
end
