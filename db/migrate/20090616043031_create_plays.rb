class CreatePlays < ActiveRecord::Migration
  def self.up
    create_table :plays do |t|
      t.integer :installation_id
      t.string :neighborhood
      t.string :type
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :web

      t.timestamps
    end
  end

  def self.down
    drop_table :plays
  end
end
