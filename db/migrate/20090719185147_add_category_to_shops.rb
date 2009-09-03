class AddCategoryToShops < ActiveRecord::Migration
  def self.up
    change_table :shops do |t|
      t.integer :shop_categories_id
    end
  end

  def self.down
    change_table :shops do |t|
    end
  end
end
