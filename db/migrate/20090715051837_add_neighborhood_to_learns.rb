class AddNeighborhoodToLearns < ActiveRecord::Migration
  def self.up
    add_column :learns, :neighborhood, :string 
  end

  def self.down
  end
end
