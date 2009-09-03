class CreateOpinions < ActiveRecord::Migration
  def self.up
    create_table :opinions do |t|
      t.string :author_name
      t.integer :stars
      t.text :content
      t.integer :opinionable_id
      t.string :opinionable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :opinions
  end
end
