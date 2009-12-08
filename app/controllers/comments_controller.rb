class CommentsController < ApplicationController
    include PolyParent
    parent_resources :installation, :housing, :eat, :school, :shop, :play, :offpost, :neighborhood
    before_filter :set_poly_parents
    before_filter :login_required
  
  # GET /comments
  # GET /comments.xml
  def index
    @installation = Installation.find(params[:installation_id]) 


  end
  
  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])
    @user = @comment.users
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @installation = Installation.find(params[:installation_id])
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def create
    @parents.last.comments.build(params[:comment])
    if @parents.last.save
      add_message( 'Thanks for adding a comment!' )
      redirect_to polymorphic_path([@parents].flatten)
      
    else
      flash[:error] = @parents.last.errors.full_messages.to_sentence
      render :action => :new
    end
  end

  # POST /comments
  # POST /comments.xml
  #def create
    #@commentable = find_commentable
    #@comment = @commentable.comments.build(params[:comment])
    #if @comment.save
      #flash[:notice] = "Successfully created comment."
      #redirect_to installation_commentable_path(@commentable.installation, @commentable)
    #else
      #render :action => 'new'
    #end
  #end
  

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_path([@parents, :comments ].flatten) }
      format.xml  { head :ok }
    end
  end
end

