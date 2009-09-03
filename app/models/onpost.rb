class Onpost < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  has_many :comments, :as => :commentable
  #acts_as_commentable
  
  def average_stars
    comments.average(:stars)
  end
  
  def average_rates
    comments.average(:stars)
  end
  
end
