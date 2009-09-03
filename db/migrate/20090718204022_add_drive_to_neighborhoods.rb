class AddDriveToNeighborhoods < ActiveRecord::Migration
  def self.up
    change_table :neighborhoods do |t| 
      t.string :drive
      t.string :distance
    end
  end

  def self.down
  end
end
