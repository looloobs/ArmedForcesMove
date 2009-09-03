class Play < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  belongs_to :play_category
  belongs_to :play_area
  has_many :comments, :as => :commentable
  
  
  def average_rates
    comments.average(:stars)
  end
end
