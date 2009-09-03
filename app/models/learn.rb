class Learn < ActiveRecord::Base
  has_many :offposts
  has_many :comments, :as => :commentable

  /named_scope :area, :conditions => { :offpost.neighborhood => 'Dupont' }
  named_scope :low_stars, :conditions => { :stars => 1..3 }/
  
  
  def average_rates
    comments.average(:stars)
  end
  
  # Return a set of records matching the given +filters+.
   #
   # ==== Options
   # +filters+ Hash of filters that are parsed to build SQL conditions.
   #
   # ==== Examples
   # To find all users with Joe in their name
   # User.search :all, :filters => { :terms => %w(joe) }
   #
   # To find the first user with the terms "Fred" and "Smith" in their name
   # User.search :first, :filters => { :terms => %w(Fred Smith) }
   #
   # To find only admin users
   # User.search :all, :filters => { :admin => true }
   def self.search(*args)
     options = args.extract_options!

     # Extract filters from the options, or default to empty
     filters = options.delete(:filters) || {}

     # Create an empty condition clause, into which we can append filters
     combined_conditions = Caboose::EZ::Condition.new :learns

     # Use filter terms to search by first_name OR last_name
     unless filters[:terms].nil?
       filters[:terms].each do |term|
         term = ['%', term, '%'].join

         condition = Caboose::EZ::Condition.new :learns do

         end

         condition.append ['name LIKE ?', term]

         combined_conditions << condition
       end
     end

     # Apply the :admin filter
     unless filters[:admin].nil?
       condition = Caboose::EZ::Condition.new :learns do
         admin == filters[:admin]
       end

       combined_conditions << condition
     end

     # Apply the :status filter
     unless filters[:offposts].nil?
       condition = Caboose::EZ::Condition.new :offposts do
         offposts === [*filters[:offposts]] # use [*obj] rather than obj.to_a as Object.to_a is depracated
       end
        
       combined_conditions << condition
     end

     # Convert the combined set of filter conditions to a SQL fragment, and store in the options hash for User.find
     options[:conditions] = combined_conditions.to_sql

     self.find(args.first, options)
   end

  
  
  
end
