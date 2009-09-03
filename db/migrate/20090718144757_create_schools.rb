class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :level
      t.text :info
      t.boolean :onpost
      t.string :type
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :web
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
