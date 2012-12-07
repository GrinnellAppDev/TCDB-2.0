class ShiftsController < ApplicationController

	def new
		@shift = Shift.new
	end

	def create
		@shift = Shift.new(params[:shift])

		if @shift.save
      		flash.now[:success] = "Shift created"
      		#CHECK redirect somewhere. 
    		redirect_to :action => 'create'
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

  		@fall_break_start_date = DateTime.new()
  		@fall_break_start_time = DateTime.new()


	end

	def create_all_shifts
		puts "HAHAHAHAH"

		flash[:success] = params[:semester_start_date]
		redirect_to prepsemester_path
	end

end

