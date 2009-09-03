class RolesController < ApplicationController
  require_role "admin"
  def index
  end

  def new 
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def create
    
    @role = Role.new(params[:role])
    respond_to do |format|
      if @role.save
        flash[:notice] = 'Role was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @onpost, :status => :created, :location => @onpost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @onpost.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
