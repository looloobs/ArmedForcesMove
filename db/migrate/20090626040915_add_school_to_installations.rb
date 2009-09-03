class AddSchoolToInstallations < ActiveRecord::Migration
  def self.up
    add_column :installations, :commissary_times, :string 
    add_column :installations, :school, :string 
    add_column :installations, :px_times, :string 
    add_column :installations, :housing, :string 
  end

  def self.down
  end
end
