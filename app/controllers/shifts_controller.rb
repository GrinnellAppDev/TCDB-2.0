class ShiftsController < ApplicationController

	def new
		@shift = Shift.new
	end

	def create
		@shift = Shift.new(params[:shift])

		if @shift.save
      		flash.now[:success] = "Shift created"
      		#CHECK redirect somewhere. 
      		render 'new'
		else 
			flash.now[:failure] = "Shift not created"
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def prepsemester
		#Need a way to access the current lab that's being looked at. 
  		#Default to Helpdesk for now. 
  		@lab = Lab.find(2)
  		@shift_time = @lab.shift_times.build(params[:shift_time])

  		#Get an array of all shiftimes.
  		@shift_times = ShiftTime.find_all_by_lab_id (1)
  		if @shift_times.nil?
  			@shift_times = Array.new(1) { ShiftTime.new }
  		end

	end

	def create_all_shifts
		puts "HAHAHAHAH"
	end

end

