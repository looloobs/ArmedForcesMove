class AddInstallationToHousings < ActiveRecord::Migration
  def self.up
    change_table :housings do |t| 
      t.integer :neighborhood_id
      t.integer :installation_id
    end
  end

  def self.down
  end
end
