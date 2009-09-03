class CreateEats < ActiveRecord::Migration
  def self.up
    create_table :eats do |t|
      t.integer :installation_id
      t.string :type
      t.string :price
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :web
      t.string :phone
      t.boolean :kid
      t.boolean :special
      t.boolean :military

      t.timestamps
    end
  end

  def self.down
    drop_table :eats
  end
end
