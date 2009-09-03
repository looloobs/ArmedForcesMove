class PlayAreasController < ApplicationController
  # GET /play_areas
  # GET /play_areas.xml
  def index
    @play_areas = PlayArea.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @play_areas }
    end
  end

  # GET /play_areas/1
  # GET /play_areas/1.xml
  def show
    @play_area = PlayArea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @play_area }
    end
  end

  # GET /play_areas/new
  # GET /play_areas/new.xml
  def new
    @play_area = PlayArea.new
    @installation = Installation.find(params[:installation_id]) 
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @play_area }
    end
  end

  # GET /play_areas/1/edit
  def edit
    @play_area = PlayArea.find(params[:id])
    @installation = Installation.find(params[:installation_id]) 
  end

  # POST /play_areas
  # POST /play_areas.xml
  def create
    @play_area = PlayArea.new(params[:play_area])

    respond_to do |format|
      if @play_area.save
        flash[:notice] = 'PlayArea was successfully created.'
        format.html { redirect_to(@play_area) }
        format.xml  { render :xml => @play_area, :status => :created, :location => @play_area }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /play_areas/1
  # PUT /play_areas/1.xml
  def update
    @play_area = PlayArea.find(params[:id])

    respond_to do |format|
      if @play_area.update_attributes(params[:play_area])
        flash[:notice] = 'PlayArea was successfully updated.'
        format.html { redirect_to(@play_area) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play_area.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /play_areas/1
  # DELETE /play_areas/1.xml
  def destroy
    @play_area = PlayArea.find(params[:id])
    @play_area.destroy

    respond_to do |format|
      format.html { redirect_to(play_areas_url) }
      format.xml  { head :ok }
    end
  end
end
