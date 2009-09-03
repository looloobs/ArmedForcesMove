class MakeChangesToNeighborhoods < ActiveRecord::Migration
  def self.up
    change_table :neighborhoods do |t| 
      t.integer :installation_id 
    end
  end

  def self.down
  end
end
