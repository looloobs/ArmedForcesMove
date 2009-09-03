# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  # render new.rhtml
  def new
    render :layout => 'users'
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      redirect_back_or_default('/')
      flash[:notice] = "Logged in successfully"
    else
      redirect_to :back
      flash[:error] = "Incorrect username and/or password"
   
    end
    
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

  def edit    
    @user = User.find(params[:id], :conditions => ["id = ?", current_user.id])
  end

  def update  
    params[:user][:role_ids] ||= []  
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "User was successfully updated."
      redirect_to :action => 'edit', :id => @user
    else
      flash[:error] = 'Unsuccessful. Try again.'
      redirect_to :action => 'edit', :id => @user
    end
    
  end

  def change_password    
    @user = User.find(params[:id])

    return unless request.post?
      if (params[:password] == params[:password_confirmation])
        current_user.password_confirmation = params[:password_confirmation]
        current_user.password = params[:password]
        flash[:notice] = current_user.save ?
        "Password changed" : 
        "Password not changed. Try again."

      else
        flash[:error] = "Password mismatch. Try again." 
        @old_password = params[:old_password]
      end
  end
end