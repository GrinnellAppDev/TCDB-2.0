class TimeWorkedsController < ApplicationController
  before_filter :logged_in_user
  
  def clock

    if current_user.clocked_in?

      #redirect_to :action => 'edit'

      self.edit
      render 'edit'
    else

      #redirect_to :action => 'new'

      self.new
      render 'new'
    end

  end

  def new
    @time_worked = TimeWorked.new(:user_id => current_user.id, :starttime => Time.now )
  end

  def create
  	@time_worked = TimeWorked.new(params[:time_worked])
  	if @time_worked.save
      flash[:success] = "Clocked In Successfully"
  		redirect_to root_url
  	else
  		render 'clock'
  	end

  end

  def edit
    @time_worked = current_user.current_time_worked
  end

  def update

    @time_worked = TimeWorked.find(params[:id])
    
    if current_user.clocked_in?
      @time_worked.endtime = Time.now
    end

    if @time_worked.update_attributes(params[:time_worked])
      flash[:success] = "Clocked Out Successfully"
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
