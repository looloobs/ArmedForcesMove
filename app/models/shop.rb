class Shop < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  belongs_to :shop_category
  has_many :comments, :as => :commentable
  validates_presence_of :neighborhood_id, :shop_categories_id, :type, :name, :address, :city, :state, :zip
  
  def average_rates
    comments.average(:stars)
  end
end
