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
  		@start_date = params[:semester_start_date]
  		@end_date  = params[:semester_end_date]


  		for lab in Lab.all 

		#Skip over lab that don't have defaults. 
		@start_date.to_date.upto(@end_date.to_date) do |day|

  			# check if day is in bounds - or Colins way so no checking.
  			for shift_time in lab.shift_times
  				if !shift_time.nil?
  					lab_time = lab.lab_times.find_by_day_of_week(day.wday)
  					puts shift_time.start.hour
  					# puts shift_time.end.hour
  					# puts lab_time.open.hour
  					# puts lab_time.close.hour
  					# puts shift_time.start.minute
  					# puts shift_time.end.minute
  					# puts lab_time.open.minute
  					# puts lab_time.close.minute

  					if shift_time.start.hour > lab_time.open.hour || shift_time.start.hour >= lab_time.open.hour && shift_time.start.minute >= lab_time.open.minute
  						if shift_time.end.hour < lab_time.close.hour || shift_time.end.hour <= lab_time.close.hour && shift_time.end.minute <= lab_time.close.minute
  							puts "A shift created"
  							shift = Shift.new(lab_id: lab.lab_id, filled:"false", 
  								starttime:shift_time.start, endtime:shift_time.end )
  							shift.save
  							puts shift.starttime
  							puts shift.endtime
  						end
  					end
  				end
  			end
  		end


  	end





  	flash[:success] = params[:semester_start_date]
  	redirect_to prepsemester_path
  end

end

