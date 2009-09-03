class CreatePlayAreas < ActiveRecord::Migration
  def self.up
    create_table :play_areas do |t|
      t.integer :installation_id
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :play_areas
  end
end
