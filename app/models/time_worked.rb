class TimeWorked < ActiveRecord::Base
  attr_accessible :comment, :endtime, :lab_id, :shift_id, :starttime, :user_id, :payrate

  # Every Time Worked record must be associated with a user.
  belongs_to :user
  belongs_to :shift #and :labs
  

  # to do defaults..
  after_initialize :init

    def init
      self.payrate ||= 8.50		#will set the default value only if it's nil
      self.lab_id   ||= Lab.helpdesk1.id
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

  def shift_assoc 
    possible_shifts = self.user.shifts.where( :starttime => (self.starttime - 15.minutes)..(self.starttime + 15.minutes))
    shift = possible_shifts.first

    if (shift != nil && shift.lab_id = self.lab_id) #and there's only one result
      self.shift_id = shift.id
      shift.filled = true
      shift.save
      # shift.tw_id = time_worked.id // TODO: add this in the future
      # TimeWorked should also include a reference to the filled shift..
    end
  end

end
