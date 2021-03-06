require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :users, :through => :schools
  attr_accessible :role_ids
 
  
  
  # ---------------------------------------
  # The following code has been generated by role_requirement.
  # You may wish to modify it to suit your need
  has_and_belongs_to_many :roles
  
  # has_role? simply needs to return true or false whether a user has a role or not.  
  # It may be a good idea to have "admin" roles return true always
  def has_role?(role_in_question)
    @_list ||= self.roles.collect(&:name)
    return true if @_list.include?("admin")
    (@_list.include?(role_in_question.to_s) )
  end
  # ---------------------------------------
  
  
  
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  validates_presence_of     :login
  validates_length_of       :login,    :within => 3..40
  validates_uniqueness_of   :login
  validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  validates_length_of       :name,     :maximum => 100

  validates_presence_of     :email
  validates_length_of       :email,    :within => 6..100 #r@a.wk
  validates_uniqueness_of   :email
  validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :name, :password, :password_confirmation



  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  protected

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
      combined_conditions = Caboose::EZ::Condition.new :users

      # Use filter terms to search by first_name OR last_name
      unless filters[:terms].nil?
        filters[:terms].each do |term|
          term = ['%', term, '%'].join

          condition = Caboose::EZ::Condition.new :users do

          end

          condition.append ['name LIKE ?', term], :or
          condition.append ['login LIKE ?', term], :or
          condition.append ['email LIKE ?', term], :or

          combined_conditions << condition
        end
      end

      # Apply the :admin filter
      unless filters[:admin].nil?
        condition = Caboose::EZ::Condition.new :users do
          admin == filters[:admin]
        end

        combined_conditions << condition
      end

      # Apply the :status filter
      unless filters[:login].nil?
        condition = Caboose::EZ::Condition.new :users do
          login === [*filters[:login]] # use [*obj] rather than obj.to_a as Object.to_a is depracated
        end
         
        combined_conditions << condition
      end

      # Convert the combined set of filter conditions to a SQL fragment, and store in the options hash for User.find
      options[:conditions] = combined_conditions.to_sql

      self.find(args.first, options)
    end


end
