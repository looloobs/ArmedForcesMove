class RenameColumnOfComments < ActiveRecord::Migration
  def self.up
    rename_column :comments, :author_name, :user_id
  end

  def self.down
    rename_column :comments, :user_id, :author_name
  end
end
