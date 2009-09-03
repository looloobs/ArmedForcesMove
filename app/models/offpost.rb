class Offpost < ActiveRecord::Base
  belongs_to :installation
  has_many :learns
  has_many :comments, :as => :commentable
  #accepts_nested_attributes_for :opinionable
  
  def average_rates
    comments.average(:stars)
  end
  
end
