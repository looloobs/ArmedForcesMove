class AddNeighborhoodToPlay < ActiveRecord::Migration
  def self.up
    change_table :plays do |t| 
      t.integer :neighborhood_id
    end
  end

  def self.down
  end
end
