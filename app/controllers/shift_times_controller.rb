class ShiftTimesController < ApplicationController

  def index
  end

  def create
  	#Need a way to access the current lab that's being looked at. 
  	#Default to Helpdesk for now. 
  	@lab = Lab.find(2)
  	@shift_time = @lab.shift_times.build(params[:shift_time])
  	if @shift_time.save
  		flash[:success] = "Shift Time for #{@lab.labname} created"
  		render 'shifts/prepsemester'
  	else
  		flash[:notice] = "Hmm.. Something went wrong"
  		render 'shifts/prepsemester'
	end
  end

  def destroy
  end

end

