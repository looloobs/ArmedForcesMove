class AddStoreToShops < ActiveRecord::Migration
  def self.up
    change_table :shops do |t| 
      t.string :store
      t.remove :type
    end
  end

  def self.down
  end
end
