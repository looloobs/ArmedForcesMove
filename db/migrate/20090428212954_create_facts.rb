class CreateFacts < ActiveRecord::Migration

  def self.up
    create_table :facts do |t|
      t.string :inprocessing
      t.string :temp_lodging
      t.string :hospital
      t.string :commissary
      t.string :px

      t.timestamps
    end
  end

  def self.down
    drop_table :facts
  end
end
