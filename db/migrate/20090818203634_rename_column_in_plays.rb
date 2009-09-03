class RenameColumnInPlays < ActiveRecord::Migration
  def self.up
    rename_column :plays, :play_categories_id, :play_category_id
    rename_column :plays, :play_areas_id, :play_area_id
  end

  def self.down
    rename_column :plays, :play_categories_id
  end
end
