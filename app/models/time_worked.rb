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

end
