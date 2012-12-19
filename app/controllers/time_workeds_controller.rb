class TimeWorkedsController < ApplicationController
  before_filter :logged_in_user
  before_filter :clocked_in?, only: [:edit, :update]
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
    @time_worked = @current_user.clock_in 
  end

  def create
  	@time_worked = TimeWorked.new(params[:time_worked])
    @time_worked.shift_assoc # check in future
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
     current_user.clock_out

    if current_user.current_time_worked.save
      flash[:success] = "Clocked Out Successfully"
      redirect_to root_url
    else
      @time_worked = current_user.current_time_worked
      render 'edit'
    end
  end

  private
    def logged_in_user
     if(!logged_in?)
        redirect_to login_url
    end

    def clocked_in?
      redirect_to :action => 'new' unless current_user.clocked_in?
    end
  end


end
