class ShopcatsController < ApplicationController
  # GET /shopcats
  # GET /shopcats.xml
  def index
    @shopcats = Shopcat.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shopcats }
    end
  end

  # GET /shopcats/1
  # GET /shopcats/1.xml
  def show
    @shopcat = Shopcat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shopcat }
    end
  end

  # GET /shopcats/new
  # GET /shopcats/new.xml
  def new
    @shopcat = Shopcat.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shopcat }
    end
  end

  # GET /shopcats/1/edit
  def edit
    @shopcat = Shopcat.find(params[:id])
  end

  # POST /shopcats
  # POST /shopcats.xml
  def create
    @shopcat = Shopcat.new(params[:shopcat])

    respond_to do |format|
      if @shopcat.save
        flash[:notice] = 'Shopcat was successfully created.'
        format.html { redirect_to(@shopcat) }
        format.xml  { render :xml => @shopcat, :status => :created, :location => @shopcat }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shopcat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shopcats/1
  # PUT /shopcats/1.xml
  def update
    @shopcat = Shopcat.find(params[:id])

    respond_to do |format|
      if @shopcat.update_attributes(params[:shopcat])
        flash[:notice] = 'Shopcat was successfully updated.'
        format.html { redirect_to(@shopcat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shopcat.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shopcats/1
  # DELETE /shopcats/1.xml
  def destroy
    @shopcat = Shopcat.find(params[:id])
    @shopcat.destroy

    respond_to do |format|
      format.html { redirect_to(shopcats_url) }
      format.xml  { head :ok }
    end
  end
end
