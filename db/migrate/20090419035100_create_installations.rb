class CreateInstallations < ActiveRecord::Migration
  def self.up
    create_table :installations do |t|
      t.string :name
      t.integer :zipcode
      t.string :city
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :installations
  end
end
