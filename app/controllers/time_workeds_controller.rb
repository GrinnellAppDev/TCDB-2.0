class TimeWorkedsController < ApplicationController
  before_filter :logged_in_user
  
  def clock
  	@current_time_worked = TimeWorked.where(:endtime => nil).find_by_userid(current_user.id)
	  @time_worked = (@current_time_worked == nil) ? TimeWorked.new( :userid => current_user.id, :starttime => Time.now ) : @current_time_worked 
  end

  def create
  	@time_worked = TimeWorked.new(params[:time_worked])
  	if @time_worked.save
  		redirect_to root
  	else
  		render 'clock'
  	end

  end

  private
    def logged_in_user
     if(!logged_in?)
        redirect_to login_url
    end
  end

end
