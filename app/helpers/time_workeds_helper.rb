module TimeWorkedsHelper

  def clock_in(time_worked, lab, mentoring)
 	
    # find associated shift if it exists
    #posssible_shifts = Shift.where(starttime: (Time.now-15.minutes)..(Time.now+30.minutes))
	posssible_shifts = Shift.where( :starttime => (Time.now-15.minutes)..(Time.now+30.minutes))


    #time = Shift.find_by_userid current_user.id
    #check possible shifts for nil
    shift = possible_shifts.find_by_userid(current_user.id)
    if mentoring
      time_worked.payrate = "9.10" #TODO dry up magic numbers
    end

    if (shift != nil && shift.lab_id = lab) #and there's only one result
      shift_assoc(time_worked, shift)
      # shift.tw_id = time_worked.id // TODO: add this in the future
      # TimeWorked should also include a reference to the filled shift..
    else
      time_worked.lab_id = lab
    end
    time_worked.save!
    # TODO: figure out how to rescue if the sift isn't valid..
  end

  def clock_out(mentoring)

   	current_time_worked.endtime = Time.now
    if mentoring
      time.payrate = "9.10"
    end

    time.save!
    @time_worked = nil
  end

  #def current_user
  #	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  #end

  def current_time_worked
    #@time_worked ||= TimeWorked.where(endtime: nil).find_by_userid(current_user.id)
    @time_worked ||= TimeWorked.where(:endtime => nil).find_by_userid(current_user.id)
  end

  def clocked_in?
    # determine if the user is clocked
    current_time_worked != nil
  end

  def add_comment(comment)
    current_time_worked.comment = comment
    current_time_worked.save!
  end

  # TODO: get rid of this after talking to Colin..
  def edit_comment(comment)
    current_time_worked.comment = comment
  end

  def get_comment
    current_time_worked.comment
  end

  def shift_assoc(timeWorked, shift)
    shift.filled = true
    timeWorked.shiftid = shift.id
    # shift.time_workeds_id = timeWorked.id
  end

end
