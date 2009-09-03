class ChangeEatsTable < ActiveRecord::Migration
  def self.up
    change_table :eats do |t|
      t.remove :type
      t.remove :price
      t.integer :type
      t.integer :price
      
  end
end

  def self.down
  end
end
