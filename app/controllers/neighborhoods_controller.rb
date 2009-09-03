class NeighborhoodsController < ApplicationController
  # GET /neighborhoods
  # GET /neighborhoods.xml
  def index
    @installation = Installation.find(params[:installation_id])
    @neighborhoods = @installation.neighborhoods
        respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @neighborhoods }
    end
  end

  # GET /neighborhoods/1
  # GET /neighborhoods/1.xml
  def show
    @installation = Installation.find(params[:installation_id])
    @neighborhood = Neighborhood.find(params[:id])
    @preschools = @neighborhood.schools.preschool
    @elementary = @neighborhood.schools.elementary
    @middle = @neighborhood.schools.middle
    @high = @neighborhood.schools.high
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @neighborhood }
    end
  end

  # GET /neighborhoods/new
  # GET /neighborhoods/new.xml
  def new
    @neighborhood = Neighborhood.new
    @installation = Installation.find(params[:installation_id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @neighborhood }
    end
  end

  # GET /neighborhoods/1/edit
  def edit
     @installation = Installation.find(params[:installation_id])
    @neighborhood = Neighborhood.find(params[:id])
    render :layout => "cms"
  end

  # POST /neighborhoods
  # POST /neighborhoods.xml
  def create
    @installation = Installation.find(params[:installation_id])
    @neighborhood = Neighborhood.new(params[:neighborhood])

    respond_to do |format|
      if @neighborhood.save
        flash[:notice] = 'Neighborhood was successfully created.'
        format.html { redirect_to (@neighborhood) }
        format.xml  { render :xml => @neighborhood, :status => :created, :location => @neighborhood }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /neighborhoods/1
  # PUT /neighborhoods/1.xml
  def update
    @neighborhood = Neighborhood.find(params[:id])
    @installation = Installation.find(params[:installation_id])
    respond_to do |format|
      if @neighborhood.update_attributes(params[:neighborhood])
        flash[:notice] = 'Neighborhood was successfully updated.'
        format.html { redirect_to installation_neighborhood_path(@installation, @neighborhood) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @neighborhood.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /neighborhoods/1
  # DELETE /neighborhoods/1.xml
  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @neighborhood.destroy

    respond_to do |format|
      format.html { redirect_to(neighborhoods_url) }
      format.xml  { head :ok }
    end
  end
end
