class UsersController < ApplicationController
  #require_role "admin"

  # Be sure to include AuthenticationSystem in Application Controller instead
  def index
    params[:search] ||= {}
    params[:search][:admin] = (params[:search][:admin] == "true" ? true : nil)

    @users = User.search(:all, :filters => params[:search])
  end

  # render new.rhtml
  def new
    @user = User.new
  end
  
  def show
		@user = User.find(params[:id])
	end
 
  def create
      cookies.delete :auth_token
      # protects against session fixation attacks, wreaks havoc with 
      # request forgery protection.
      # uncomment at your own risk
      # reset_session
      params[:user][:role_ids] ||= []
      @user = User.new(params[:user])
      @user.save
      if @user.errors.empty?
        self.current_user = @user
        redirect_back_or_default('/')
        flash[:notice2] = "Thanks for signing up!"
      else
        render :action => 'new'
      end
    end
end

def edit    
  @user = current_user
end

def update  
  @user = current_user
  if @user.update_attributes(params[:user])
    flash[:notice] = 'Shop was successfully updated.'
    redirect_to { redirect_to(current_user) }
  else
    flash[:error] = 'Unsuccessful. Try again.'
    redirect_to :action => 'edit', :id => @user
  end
end

  
def destroy
  @user = User.find(params[:id])
  @user.destroy

  respond_to do |format|
    format.html { redirect_to(users_url) }
    format.xml  { head :ok }
  end
end


