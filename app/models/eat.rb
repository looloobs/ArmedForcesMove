class Eat < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  has_many :comments, :as => :commentable
  validates_presence_of :neighborhood_id, :food, :name, :address, :city, :state, :zip, :price
  
  
  def average_rates
    comments.average(:stars)
  end
  



  
end
