class AddLearnToOffposts < ActiveRecord::Migration
  def self.up
     add_column :offposts, :learn_id, :integer
   end

   def self.down
     remove_column :offposts, :learn_id
   end
end
