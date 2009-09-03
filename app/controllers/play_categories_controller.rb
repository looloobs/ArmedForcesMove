class PlayCategoriesController < ApplicationController
  # GET /play_categories
  # GET /play_categories.xml
  def index
    @play_categories = PlayCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @play_categories }
    end
  end

  # GET /play_categories/1
  # GET /play_categories/1.xml
  def show
    @play_category = PlayCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @play_category }
    end
  end

  # GET /play_categories/new
  # GET /play_categories/new.xml
  def new
    @play_category = PlayCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @play_category }
    end
  end

  # GET /play_categories/1/edit
  def edit
    @play_category = PlayCategory.find(params[:id])
  end

  # POST /play_categories
  # POST /play_categories.xml
  def create
    @play_category = PlayCategory.new(params[:play_category])

    respond_to do |format|
      if @play_category.save
        flash[:notice] = 'PlayCategory was successfully created.'
        format.html { redirect_to(@play_category) }
        format.xml  { render :xml => @play_category, :status => :created, :location => @play_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /play_categories/1
  # PUT /play_categories/1.xml
  def update
    @play_category = PlayCategory.find(params[:id])

    respond_to do |format|
      if @play_category.update_attributes(params[:play_category])
        flash[:notice] = 'PlayCategory was successfully updated.'
        format.html { redirect_to(@play_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /play_categories/1
  # DELETE /play_categories/1.xml
  def destroy
    @play_category = PlayCategory.find(params[:id])
    @play_category.destroy

    respond_to do |format|
      format.html { redirect_to(play_categories_url) }
      format.xml  { head :ok }
    end
  end
end
