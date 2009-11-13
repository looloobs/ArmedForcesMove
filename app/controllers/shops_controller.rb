class ShopsController < ApplicationController
  # GET /shops
  # GET /shops.xml
  def index
    @installation = Installation.find(params[:installation_id]) 
    @shops= @installation.shops

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    @installation = Installation.find(params[:installation_id]) 
    @shop = Shop.find(params[:id])
    @neighborhoods = @shop.neighborhood
    @shopcategories = @shop.shop_category
    @comment = @shop.comments

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.xml
  def new
    @installation = Installation.find(params[:installation_id])
    @neighborhoods = @installation.neighborhoods
    @shopcategories = ShopCategory.all
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @shop = Shop.find(params[:id])
    @installation = Installation.find(params[:installation_id]) 
    @neighborhoods = @installation.neighborhoods
    @shopcategories = ShopCategory.all
  end

  # POST /shops
  # POST /shops.xml
  def create
    @shop = Shop.new(params[:shop])
    @installation = Installation.find(params[:installation_id]) 
    @shopcategories = ShopCategory.all
    @neighborhoods = @installation.neighborhoods
    respond_to do |format|
      if @shop.save
        flash[:notice] = 'Shop was successfully created.' 
        format.html { redirect_to installation_shops_path(@installation) }
        format.xml  { render :xml => @shop, :status => :created, :location => @shop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shops/1
  # PUT /shops/1.xml
  def update
    @shop = Shop.find(params[:id])
    @installation = Installation.find(params[:installation_id]) 
    @neighborhoods = @installation.neighborhoods
    @shopcategories = ShopCategory.all
    respond_to do |format|
      if @shop.update_attributes(params[:shop])
        flash[:notice] = 'A shop was successfully updated.'
        format.html { redirect_to installation_shop_path(@installation, @shop)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.xml
  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end
end
