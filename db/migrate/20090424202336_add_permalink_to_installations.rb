class AddPermalinkToInstallations < ActiveRecord::Migration
  def self.up
    add_column :installations, :permalink, :string
  end

  def self.down
    remove_column :installations, :permalink
  end
end
