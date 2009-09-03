class LearnsController < ApplicationController
  # GET /learns
  # GET /learns.xml
  def index
    @installation = Installation.find(params[:installation_id])  
    @offpost = @installation.offposts
    @learns = @offpost.learns
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @learns }
    end
  end

  # GET /learns/1
  # GET /learns/1.xml
  def show
    @installation = Installation.find(params[:installation_id])
    @learn = Learn.find(params[:id])
    @comment = @learn.comments
    @user = @comment.users
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @learn }
    end
  end

  # GET /learns/new
  # GET /learns/new.xml
  def new
    @learn = Learn.new
    @installation = Installation.find(params[:installation_id])
    @neighborhoods = @installation.neighborhoods
    render :layout => 'cms'
  end

  # GET /learns/1/edit
  def edit
    @learn = Learn.find(params[:id])
  end

  # POST /learns
  # POST /learns.xml
  def create
    @installation = Installation.find(params[:installation_id])
    @learn = Learn.new(params[:learn])
    respond_to do |format|
      if @learn.save
        flash[:notice] = 'Learn was successfully created.'
        format.html { redirect_to :back}
        format.xml  { render :xml => @learn, :status => :created, :location => @learn }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @learn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /learns/1
  # PUT /learns/1.xml
  def update
    @learn = Learn.find(params[:id])

    respond_to do |format|
      if @learn.update_attributes(params[:learn])
        flash[:notice] = 'Learn was successfully updated.'
        format.html { redirect_to(@learn) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @learn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /learns/1
  # DELETE /learns/1.xml
  def destroy
    @learn = Learn.find(params[:id])
    @learn.destroy

    respond_to do |format|
      format.html { redirect_to(learns_url) }
      format.xml  { head :ok }
    end
  end
end
