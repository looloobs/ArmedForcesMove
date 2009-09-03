class AddPlayareaToPlays < ActiveRecord::Migration
  def self.up
    change_table :plays do |t| 
      t.integer :play_areas_id
    end
  end

  def self.down
  end
end
