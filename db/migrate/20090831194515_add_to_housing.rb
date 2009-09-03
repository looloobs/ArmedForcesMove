class AddToHousing < ActiveRecord::Migration
  def self.up
    add_column :housings, :bedrooms, :string
    add_column :housings, :bathrooms, :string
  end

  def self.down
    remove_column :housings, :bedrooms
    remove_column :housings, :bathrooms
  end
end
