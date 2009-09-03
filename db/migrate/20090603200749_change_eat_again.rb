class ChangeEatAgain < ActiveRecord::Migration
  def self.up
    change_table :eats do |t|
      t.remove :type
      t.remove :price
      t.string :type
      t.string :price
      
  end
end

  def self.down
  end
end
