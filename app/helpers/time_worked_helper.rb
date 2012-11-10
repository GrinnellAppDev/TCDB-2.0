module TimeWorkedHelper
	
	def clock_in(tc, lab, mentoring)
		@time_worked = TimeWorked.new do |tw|
			tw.starttime = Time.now,  
			tw.userid =  tc.userid 

			# find associated shift if it exists
			Shits.find_by_userid tc.userid

		end 

	end

	def clock_out(user, mentoring)
		if ( @time_worked != nil )
			time = @time_worked	
		else
			time = TimeWorked.find_by_
		end

		time.endtime = Time.now
		@time_worked = nil
	end

	def add_comment(comment)

	end

	def edit_comment(comment)

	end

	def shift_assoc

	end

end