module TimeWorkedHelper
	
	def clock_in(tc, lab, mentoring, pay)
		@time_worked = TimeWorked.new do |tw|
			tw.starttime = Time.now,  
			tw.userid =  tc.id 

			# find associated shift if it exists
			posssible_shifts = Shift.where(starttime: (Time.now-15.minutes)..(Time.now+30.minutes))
			
			#time = Shift.find_by_userid tc.id
			#check possible shifts for nil
			shift = possible_shifts.find_by_userid(tc.id)
			if mentoring
				tw.payrate = "9.10" #TODO dry up magic numbers
			end

			if (shift != nil && shift.labid = lab) #and there's only one result
				shift.filled = true
				tw.shiftid = shift.id
				# shift.tw_id = tw.id // TODO: add this in the future
				# TimeWorked should also include a reference to the filled shift..
			else 
				tw.labid = lab
			end
			tw.save!
			# TODO: figure out how to rescue if the sift isn't valid..
		end 

	end

	def clock_out(user, mentoring)
		if ( @time_worked != nil )
			time = @time_worked	
		else
			time = TimeWorked.where(endtime: nil).find_by_userid(user.id)
		end

		time.endtime = Time.now
		if mentoring
			time.payrate = "9.10"
		end

		time.save!
		@time_worked = nil
	end

	# Talk to Colin
	def get_current_timeworked(user)
		if ( @time_worked != nil )
			@time_worked	
		else
			TimeWorked.where(endtime: nil).find_by_userid(user.id)
		end
	end 

	def clocked_in?(user)
		# determine if the user is clocked 
		get_current_timeworked(user) != nil		
	end

	def add_comment(comment)
		@time_worked.comment = comment
	end

	# TODO: get rid of this..
	def edit_comment(comment)
		@time_worked.comment = comment
	end

	def get_comment
		@time_worked.comment
	end

	def shift_assoc(timeWorked, shift)
		timeWorked.shiftid = shift.id
		# shift.time_workeds_id = timeWorked.id
	end

end