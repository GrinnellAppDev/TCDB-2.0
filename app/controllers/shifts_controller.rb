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
		
	end

end

