class Play < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  belongs_to :play_category
  belongs_to :play_area
  has_many :comments, :as => :commentable
  validates_presence_of :play_area_id, :play_category_id, :shop_category_id, :name
  
  
  def average_rates
    comments.average(:stars)
  end
end
