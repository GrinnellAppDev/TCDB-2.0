module TimeWorkedsHelper

  #def current_user
  #	@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  #end

  def current_time_worked
    @time_worked ||= TimeWorked.where(:endtime => nil).find_by_user_id(current_user.id)
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
    timeWorked.shift_id = shift.id
    # shift.time_workeds_id = timeWorked.id
  end

end
