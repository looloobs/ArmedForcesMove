class AddSomethingToOnposts < ActiveRecord::Migration
  def self.up
    change_table :onposts do |t| 
      t.integer :neighborhood_id
  end
  end

  def self.down
  end
end
