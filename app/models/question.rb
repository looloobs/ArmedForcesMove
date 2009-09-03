class Question < ActiveRecord::Base
  has_many :answers
  has_many :users
  belongs_to :installation
  acts_as_taggable
end
