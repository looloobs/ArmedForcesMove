class AddInstallationsToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :installation_id, :integer
  end

  def self.down
  end
end
