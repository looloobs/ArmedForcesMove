class CreateOffposts < ActiveRecord::Migration
  def self.up
    create_table :offposts do |t|
      t.references :installation
      t.string :neighborhood
      t.string :distance
      t.string :drive
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :offposts
  end
end
