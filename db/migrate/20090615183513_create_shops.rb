class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.integer :installation_id
      t.string :category
      t.string :type
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :phone
      t.string :web
      t.string :neighborhood

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
