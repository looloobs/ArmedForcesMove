class CreatePlayCategories < ActiveRecord::Migration
  def self.up
    create_table :play_categories do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :play_categories
  end
end
