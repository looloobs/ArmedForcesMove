class AddCategoryToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t| 
      t.string :category
    end
  end

  def self.down
  end
end
