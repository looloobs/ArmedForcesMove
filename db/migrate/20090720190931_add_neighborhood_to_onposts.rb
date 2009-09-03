class AddNeighborhoodToOnposts < ActiveRecord::Migration
  def self.up 
    remove_column :onposts, :neighborhood_id, :string
  end

  def self.down
    remove_column :table_name, :column_name
  end
end
