class CreateShopcats < ActiveRecord::Migration
  def self.up
    create_table :shopcats do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :shopcats
  end
end
