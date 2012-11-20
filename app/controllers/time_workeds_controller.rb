class TimeWorkedsController < ApplicationController
  before_filter :logged_in_user
  
  def clock
  	@current_time_worked = TimeWorked.where(:endtime => nil).find_by_userid(current_user.id)
	  @time_worked = (@current_time_worked == nil) ? TimeWorked.new( :userid => current_user.id, :starttime => Time.now ) : @current_time_worked 
  end

  def create
  	@time_worked = TimeWorked.new(params[:time_worked])
    @time_worked.userid = current_user.id
  	if @time_worked.save
  		redirect_to root_url
  	else
  		render 'clock'
  	end

  end

  def update
    @time_worked = TimeWorked.find(params[:id])
    if @time_worked.update_attributes(params[:time_worked])
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  private
    def logged_in_user
     if(!logged_in?)
        redirect_to login_url
    end
  end

end
