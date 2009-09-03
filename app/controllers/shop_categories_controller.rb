class ShopCategoriesController < ApplicationController
  # GET /shop_categories
  # GET /shop_categories.xml
  def index
    @shop_categories = ShopCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shop_categories }
    end
  end

  # GET /shop_categories/1
  # GET /shop_categories/1.xml
  def show
    @shop_category = ShopCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop_category }
    end
  end

  # GET /shop_categories/new
  # GET /shop_categories/new.xml
  def new
    @shop_category = ShopCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop_category }
    end
  end

  # GET /shop_categories/1/edit
  def edit
    @shop_category = ShopCategory.find(params[:id])
  end

  # POST /shop_categories
  # POST /shop_categories.xml
  def create
    @shop_category = ShopCategory.new(params[:shop_category])

    respond_to do |format|
      if @shop_category.save
        flash[:notice] = 'ShopCategory was successfully created.'
        format.html { redirect_to(@shop_category) }
        format.xml  { render :xml => @shop_category, :status => :created, :location => @shop_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shop_categories/1
  # PUT /shop_categories/1.xml
  def update
    @shop_category = ShopCategory.find(params[:id])

    respond_to do |format|
      if @shop_category.update_attributes(params[:shop_category])
        flash[:notice] = 'ShopCategory was successfully updated.'
        format.html { redirect_to(@shop_category) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_categories/1
  # DELETE /shop_categories/1.xml
  def destroy
    @shop_category = ShopCategory.find(params[:id])
    @shop_category.destroy

    respond_to do |format|
      format.html { redirect_to(shop_categories_url) }
      format.xml  { head :ok }
    end
  end
end
