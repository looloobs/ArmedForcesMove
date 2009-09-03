class OffpostsController < ApplicationController
  # GET /offposts
  # GET /offposts.xml

  
  def index
    @installation = Installation.find(params[:installation_id]) 
    @offposts = @installation.offposts

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @offposts }
    end
  end

  # GET /offposts/1
  # GET /offposts/1.xml
  def show
    @installation = Installation.find(params[:installation_id]) 
    @offpost = Offpost.find(params[:id])
    @learn = @offpost.learns
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @offpost }
    end
  end

  # GET /offposts/new
  # GET /offposts/new.xml
  def new
    @installation = Installation.find(params[:installation_id]) 
    @offpost = Offpost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @offpost }
    end
  end

  # GET /offposts/1/edit
  def edit
    @offpost = Offpost.find(params[:id])
  end

  # POST /offposts
  # POST /offposts.xml
  def create
    @offpost = Offpost.new(params[:offpost])

    respond_to do |format|
      if @offpost.save
        flash[:notice] = 'Offpost was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @offpost, :status => :created, :location => @offpost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @offpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /offposts/1
  # PUT /offposts/1.xml
  def update
    @offpost = Offpost.find(params[:id])

    respond_to do |format|
      if @offpost.update_attributes(params[:offpost])
        flash[:notice] = 'Offpost was successfully updated.'
        format.html { redirect_to(@offpost) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @offpost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /offposts/1
  # DELETE /offposts/1.xml
  def destroy
    @offpost = Offpost.find(params[:id])
    @offpost.destroy

    respond_to do |format|
      format.html { redirect_to(offposts_url) }
      format.xml  { head :ok }
    end
  end
end
