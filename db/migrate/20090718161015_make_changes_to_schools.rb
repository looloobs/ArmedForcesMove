class MakeChangesToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t| 
      t.integer :installation_id 
      t.integer :neighborhood_id
    end
  end

  def self.down
  end
end
