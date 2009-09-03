class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :through => :schools
  
  
  
  
   def self.filter_location(filter)
     case filter
     when 'low' then low_stars.all
     when 'high' then high_stars.all
     else all
     end
   end
  
end
