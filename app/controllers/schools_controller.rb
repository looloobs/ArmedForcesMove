class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.xml
  def index
    @installation = Installation.find(params[:installation_id])
    @schools = @installation.schools  
   

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schools }
    end
  end

  # GET /schools/1
  # GET /schools/1.xml
  def show
    @installation = Installation.find(params[:installation_id])
    @school = School.find(params[:id])
    @neighborhood = @school.neighborhood
    @comment = @school.comments
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/new
  # GET /schools/new.xml
  def new
    @installation = Installation.find(params[:installation_id]) 
    @school = School.new
     @neighborhoods = @installation.neighborhoods

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school }
    end
  end

  # GET /schools/1/edit
  def edit
    @school = School.find(params[:id])
  end

  # POST /schools
  # POST /schools.xml
  def create
    @school = School.new(params[:school]) 
    @installation = Installation.find(params[:installation_id]) 
    @neighborhoods = @installation.neighborhoods
    respond_to do |format|
      if @school.save
        flash[:notice] = 'A school was successfully created.'
        format.html { redirect_to installation_schools_path(@installation) }
        format.xml  { render :xml => @school, :status => :created, :location => @school }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schools/1
  # PUT /schools/1.xml
  def update
    @school = School.find(params[:id])

    respond_to do |format|
      if @school.update_attributes(params[:school])
        flash[:notice] = 'School was successfully updated.'
        format.html { redirect_to installation_school_path(@installation, @school) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.xml
  def destroy
    @school = School.find(params[:id])
    @school.destroy

    respond_to do |format|
      format.html { redirect_to(schools_url) }
      format.xml  { head :ok }
    end
  end
  def schools
      @schools = School.search(params)
  end
end
