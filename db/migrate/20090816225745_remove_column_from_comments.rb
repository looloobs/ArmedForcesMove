class RemoveColumnFromComments < ActiveRecord::Migration
  def self.up
    remove_column :comments, :user_id
    add_column :comments, :user_id, :integer
  end

  def self.down
    remove_column :comments, :user_id
  end
end
