class Housing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :installation
  has_many :comments, :as => :commentable
  
  def average_rates
    comments.average(:stars)
  end
end
