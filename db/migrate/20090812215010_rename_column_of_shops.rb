class RenameColumnOfShops < ActiveRecord::Migration
  def self.up
    rename_column :shops, :shop_categories_id, :shop_category_id
  end

  def self.down
    rename_column :shops, :shop_categories_id, :shop_category_id
  end
end
