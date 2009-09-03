class CreateNeighborhoods < ActiveRecord::Migration
  def self.up
    create_table :neighborhoods do |t|
      t.integer :installation_id
      t.integer :school_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :neighborhoods
  end
end
