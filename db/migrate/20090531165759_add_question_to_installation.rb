class AddQuestionToInstallation < ActiveRecord::Migration
  def self.up
    add_column :installations, :question_id, :integer
  end

  def self.down
    remove_column :installations, :question_id
  end
end
