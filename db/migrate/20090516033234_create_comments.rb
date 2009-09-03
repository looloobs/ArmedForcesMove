class CreateComments < ActiveRecord::Migration
  def self.up
      create_table :comments, :force => true do |t|
        t.string :author_name
        t.text :content
        t.timestamps
        t.integer :stars
        t.references :commentable, :polymorphic => true
      end
    end
  

  def self.down
    drop_table :comments
  end
end
