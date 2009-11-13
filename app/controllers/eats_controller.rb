class EatsController < ApplicationController
  #require_role "admin"
  before_filter :login_required, :only =>  [ :new, :edit, :update ]
  # GET /eats
  # GET /eats.xml
  def index
    @installation = Installation.find(params[:installation_id]) 
    @eats = @installation.eats.find(:all, :order => 'name')
    
    @neighborhoods = @installation.neighborhoods
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eats }
    end
  end

  # GET /eats/1
  # GET /eats/1.xml
  def show
    @installation = Installation.find(params[:installation_id]) 
    @eat = Eat.find(params[:id])
    @comment = @eat.comments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @eat }
    end
  end

  # GET /eats/new
  # GET /eats/new.xml
  def new
    @eat = Eat.new
    @installation = Installation.find(params[:installation_id]) 
    @neighborhoods = @installation.neighborhoods

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eat }
    end
  end

  # GET /eats/1/edit
  def edit
    @installation = Installation.find(params[:installation_id])
    @eat = Eat.find(params[:id])
  end

  # POST /eats
  # POST /eats.xml
  def create
    @eat = Eat.new(params[:eat])
    @installation = Installation.find(params[:installation_id]) 
    @neighborhoods = @installation.neighborhoods
    respond_to do |format|
      if @eat.save
        flash[:notice] = 'Place to eat was successfully created.'
        format.html { redirect_to installation_eats_path(@installation) }
        format.xml  { render :xml => @eat, :status => :created, :location => @eat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @eat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eats/1
  # PUT /eats/1.xml
  def update
    @eat = Eat.find(params[:id])

    respond_to do |format|
      if @eat.update_attributes(params[:eat])
        flash[:notice] = 'Eat was successfully updated.'
        format.html { redirect_to installation_eat_path(@installation, @eat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @eat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eats/1
  # DELETE /eats/1.xml
  def destroy
    @installation = Installation.find(params[:installation_id]) 
    @eat = Eat.find(params[:id])
    @eat.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
