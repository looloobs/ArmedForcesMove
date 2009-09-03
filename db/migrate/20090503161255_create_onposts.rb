class CreateOnposts < ActiveRecord::Migration
  def self.up
    create_table :onposts do |t|
      t.string :name
      t.string :rank
      t.string :size
      t.references :installation

      t.timestamps
    end
  end

  def self.down
    drop_table :onposts
  end
end
