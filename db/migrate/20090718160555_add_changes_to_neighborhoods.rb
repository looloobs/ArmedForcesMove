class AddChangesToNeighborhoods < ActiveRecord::Migration
  def self.up
    change_table :neighborhoods do |t| 
      t.remove :installation_id, :school_id  
      t.text :info  
    end 
  end

  def self.down
  end
end
