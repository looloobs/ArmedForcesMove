class AddNeighborhoodToEats < ActiveRecord::Migration
  def self.up
    change_table :eats do |t| 
      t.integer :neighborhood_id
    end
  end

  def self.down
  end
end
