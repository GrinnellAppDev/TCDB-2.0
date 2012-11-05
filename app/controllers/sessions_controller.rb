class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid username/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
