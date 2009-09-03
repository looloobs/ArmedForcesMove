class AddJoinToOffposts < ActiveRecord::Migration
  def self.up
    
    create_table "learns_offposts", :id => false do |t|
      t.integer "learn_id", "offpost_id"
    end
    add_index "learns_offposts", "learn_id"
    add_index "learns_offposts", "offpost_id"
  end

  def self.down
  end
end
