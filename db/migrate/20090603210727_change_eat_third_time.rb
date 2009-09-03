class ChangeEatThirdTime < ActiveRecord::Migration
  def self.up
    change_table :eats do |t|
      t.remove :type
      t.string :food
      
  end
  end

  def self.down
  end
end
