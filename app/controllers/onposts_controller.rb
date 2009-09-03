class OnpostsController < ApplicationController
  require_role "admin", :only => [:new]
  in_place_edit_for :onpost, :name
  
  # GET /onposts
  # GET /onposts.xml
  def index
    @installation = Installation.find(params[:installation_id]) 
    @onposts = @installation.onposts 
 
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @onposts }
    end
  end

  # GET /onposts/1
  # GET /onposts/1.xml
  def show
    @installation = Installation.find(params[:installation_id]) 
    @onpost = Onpost.find(params[:id])
    @comment = @onpost.comments
    
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @onpost }
    end
  end

  # GET /onposts/new
  # GET /onposts/new.xml
  def new
    @installation = Installation.find(params[:installation_id]) 
    @onpost = Onpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @onpost }
    end
  end

  # GET /onposts/1/edit
  def edit
    @onpost = Onpost.find(params[:id])
  end

  # POST /onposts
  # POST /onposts.xml
  def create
    
    @onpost = Onpost.new(params[:onpost])
    respond_to do |format|
      if @onpost.save
        flash[:notice] = 'Onpost was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @onpost, :status => :created, :location => @onpost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @onpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /onposts/1
  # PUT /onposts/1.xml
  def update
    @onpost = Onpost.find(params[:id])

    respond_to do |format|
      if @onpost.update_attributes(params[:onpost])
        flash[:notice] = 'Onpost was successfully updated.'
        format.html { redirect_to(@onpost) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @onpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /onposts/1
  # DELETE /onposts/1.xml
  def destroy
    @installation = Installation.find(params[:installation_id]) 
    @onpost = Onpost.find(params[:id])
    @onpost.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end

