class AddOffpostToLearns < ActiveRecord::Migration
  def self.up
    add_column :learns, :offpost_id, :integer
  end

  def self.down
    remove_column :learns, :offpost_id
  end
end
