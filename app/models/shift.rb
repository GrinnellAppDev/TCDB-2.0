class Shift < ActiveRecord::Base
  attr_accessible :endtime, :filled, :labid, :starttime, :userid

  # validation
  validates(:endtime, :presence => true)
  validates(:starttime, :presence => true)
  validates(:labid, :presence => true)
  validates(:filled, :inclusion => {:in => [true, false]})

  validate (:starttime_before_endtime)

  def self.date_range(from,to)
    Shift.where(:starttime => from..to)
  end

  def starttime_before_endtime
    if (starttime != nil && endtime != nil)
      errors.add(:starttime, "must be before end time") unless
      self.starttime < self.endtime
    end
  end 
  
end