class RemoveTypeFromSchool < ActiveRecord::Migration
  def self.up
    change_table :schools do |t| 
      t.remove :type
    end
  end

  def self.down
  end
end
