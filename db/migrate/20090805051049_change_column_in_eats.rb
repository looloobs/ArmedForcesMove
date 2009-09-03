class ChangeColumnInEats < ActiveRecord::Migration
  def self.up
    change_table :eats do |t|
      t.string :kids
      t.remove :kid
    end
    
  end

  def self.down
    change_table :eats do |t|
    end
    
  end
end
