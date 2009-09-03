class AddCategoryToPlays < ActiveRecord::Migration
  def self.up
    change_table :plays do |t| 
      t.integer :play_categories_id
      t.remove :neighborhood
    end
  end

  def self.down
  end
end
