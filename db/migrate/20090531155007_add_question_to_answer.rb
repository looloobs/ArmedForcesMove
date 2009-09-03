class AddQuestionToAnswer < ActiveRecord::Migration
  def self.up
    add_column :answers, :question_id, :integer
    add_column :answers, :user_id, :integer
  end

  def self.down
    remove_column :answers, :user_id
    remove_column :answers, :question_id
  end
end
