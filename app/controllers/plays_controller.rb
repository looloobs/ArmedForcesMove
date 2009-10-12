class PlaysController < ApplicationController
  # GET /plays
  # GET /plays.xml
  def index
    @installation = Installation.find(params[:installation_id]) 
    @plays = @installation.plays


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plays }
    end
  end

  # GET /plays/1
  # GET /plays/1.xml
  def show
    @installation = Installation.find(params[:installation_id]) 
    @play = Play.find(params[:id])
    @comment = @play.comments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @play }
    end
  end

  # GET /plays/new
  # GET /plays/new.xml
  def new
    @installation = Installation.find(params[:installation_id])
    @playareas = @installation.play_areas
    @playcategories = PlayCategory.all
    @play = Play.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @play }
    end
  end

  # GET /plays/1/edit
  def edit
    @play = Play.find(params[:id])
    @installation = Installation.find(params[:installation_id])
    @playareas = @installation.play_areas
    @playcategories = PlayCategory.all
  end

  # POST /plays
  # POST /plays.xml
  def create
    @play = Play.new(params[:play])
    @installation = Installation.find(params[:installation_id])
    @playareas = @installation.play_areas
    @playcategories = PlayCategory.all
    respond_to do |format|
      if @play.save
        flash[:notice] = 'Place to play was successfully created.'
        format.html { redirect_to installation_plays_path(@installation) }
        format.xml  { render :xml => @play, :status => :created, :location => @play }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plays/1
  # PUT /plays/1.xml
  def update
    @play = Play.find(params[:id])
    @installation = Installation.find(params[:installation_id])
    @playareas = @installation.play_areas
    @playcategories = PlayCategory.all
    respond_to do |format|
      if @play.update_attributes(params[:play])
        flash[:notice] = 'Play was successfully updated.'
        format.html { redirect_to installation_play_path(@installation, @play) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.xml
  def destroy
    @play = Play.find(params[:id])
    @play.destroy

    respond_to do |format|
      format.html { redirect_to(plays_url) }
      format.xml  { head :ok }
    end
  end
end
