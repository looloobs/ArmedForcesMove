class Installation < ActiveRecord::Base
  #has_permalink :name
  has_many :housings
  has_many :schools
  has_many :neighborhoods, :through => :housings
  has_many :neighborhoods, :through => :schools
  has_many :neighborhoods, :through => :eats
  has_many :neighborhoods
  has_many :questions
  has_many :eats
  has_many :shops
  has_many :plays
  has_many :play_areas
  before_create :generate_permalink
  validates_associated :schools
  
  
    
  protected 
    def generate_permalink
      self.permalink = name.downcase.gsub(/\W/, '-')
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
        
  end
end


end
