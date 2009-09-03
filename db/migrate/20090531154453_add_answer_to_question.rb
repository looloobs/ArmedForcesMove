class AddAnswerToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :user_id, :integer
    add_column :questions, :answer_id, :integer
  end

  def self.down
    remove_column :questions, :answer_id
    remove_column :questions, :user_id
  end
end
