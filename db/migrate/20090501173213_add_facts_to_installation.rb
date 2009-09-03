class AddFactsToInstallation < ActiveRecord::Migration
  def self.up
    add_column :installations, :inprocessing, :string
    add_column :installations, :templodging, :string
    add_column :installations, :hospital, :string
    add_column :installations, :family, :string
    add_column :installations, :commissary, :string
    add_column :installations, :px, :string
  end

  def self.down
    remove_column :installations, :px
    remove_column :installations, :commissary
    remove_column :installations, :family
    remove_column :installations, :hospital
    remove_column :installations, :templodging
    remove_column :installations, :inprocessing
  end
end
