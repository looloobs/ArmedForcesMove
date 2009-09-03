class CreateHousings < ActiveRecord::Migration
  def self.up
    create_table :housings do |t|
      t.string :name
      t.string :rank
      t.string :size
      t.text :info

      t.timestamps
    end
  end

  def self.down
    drop_table :housings
  end
end
