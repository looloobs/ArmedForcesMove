class CreateLearns < ActiveRecord::Migration
  def self.up
    create_table :learns do |t|
      t.integer :installation_id
      t.string :category
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
    drop_table :learns
  end
end
