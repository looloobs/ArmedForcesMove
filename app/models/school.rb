class School < ActiveRecord::Base
  belongs_to :installation
  belongs_to :neighborhood
  has_many :comments, :as => :commentable
  named_scope :preschool, :conditions => { :level => "Preschool" }
  named_scope :elementary, :conditions => { :level => "Elementary School" }
  named_scope :middle, :conditions => { :level => "Middle School" }
  named_scope :high, :conditions => { :level => "High School" }
  validates_presence_of :neighborhood_id, :level, :category, :name, :address, :city, :state, :zip
  
  def average_rates
    comments.average(:stars)
  end
  
 #def self.search(params, current_user)
      #page = params[:page] || 1
     # search_terms = params[:search, current_user]

      #type  = self.get_parameters(search_terms.to_s,current_user)

     # scope = School.scoped({})
     # scope = scope.conditions “schools.type = ?”, type unless type.blank?
     # scope.paginate :page => page, :order => “created_at DESC”
  #end
  
end
