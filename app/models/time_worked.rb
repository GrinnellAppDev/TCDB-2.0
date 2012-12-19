class TimeWorked < ActiveRecord::Base
  attr_accessible :comment, :endtime, :lab_id, :shift_id, :starttime, :user_id, :payrate

  # Every Time Worked record must be associated with a user.
  belongs_to :user
  belongs_to :shift #and :labs
  

  # to do defaults..
  after_initialize :init

    def init
      self.payrate ||= 8.50		#will set the default value only if it's nil
      self.lab_id   ||= 1	# 'project' for now..
      self.starttime ||= Time.now
    end

  # validation
  validates(:starttime, :presence => true)
  validates(:lab_id, :presence => true)
  validates(:user_id, presence: true)
  validates(:payrate, presence: true)

  validate (:starttime_before_endtime)

  def starttime_before_endtime
    if (starttime != nil && endtime != nil)
      errors.add(:starttime, "must be before end time") unless
      self.starttime < self.endtime
    end
  end 

  def set_mentor_pay 
    self.payrate = "9.10" #TODO dry up magic numbers
  end

  def clock_in(lab)
  
    self.lab_id = lab

    # find associated shift if it exists
    user_shifts = Shift.where(:user_id => self.user_id)
    posssible_shifts = user_shifts.where( :starttime => (Time.now-15.minutes)..(Time.now+15.minutes))
    shift = posssible_shifts.first

    if (shift != nil && shift.lab_id = lab) #and there's only one result
      self.shift_id = shift.id
      shift.filled = true
      shift.save
      # shift.tw_id = time_worked.id // TODO: add this in the future
      # TimeWorked should also include a reference to the filled shift..
    end
    self.save!
    # TODO: figure out how to rescue if the sift isn't valid..
  end

  def clock_out

    self.endtime = Time.now
    self.save!
  end


end
