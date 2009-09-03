class Neighborhood < ActiveRecord::Base
  has_many :installations, :through => :schools
  has_many :installations, :through => :eats
  has_many :installations, :through => :housings
  has_many :installations, :through => :shops
  has_many :housings
  has_many :schools
  has_many :eats
  has_many :shops
  has_many :comments, :as => :commentable
  
  
  def average_rates
    comments.average(:stars)
  end
end
