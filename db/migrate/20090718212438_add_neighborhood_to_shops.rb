class AddNeighborhoodToShops < ActiveRecord::Migration
  def self.up
    change_table :shops do |t| 
      t.remove :neighborhood
      t.integer :neighborhood_id
    end
  end

  def self.down
  end
end
