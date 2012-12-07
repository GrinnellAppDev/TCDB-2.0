class Lab < ActiveRecord::Base
  attr_accessible :lab_id, :labname

  validates(:lab_id, :presence => true)
  validates(:labname, :presence => true)

  def self.nolab
  	Lab.find_or_create_by_labname(:lab_id => 0, :labname => "Nolab")
  end

def self.helpdesk1
  	Lab.find_or_create_by_labname(:lab_id => 1, :labname => "Helpdesk1")
  end

def self.helpdesk2
  	Lab.find_or_create_by_labname(:lab_id => 2, :labname => "Helpdesk2")
  end

def self.helpdesk3
  	Lab.find_or_create_by_labname(:lab_id => 3, :labname => "Helpdesk3")
  end

def self.av1
  	Lab.find_or_create_by_labname(:lab_id => 4, :labname => "AV1")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 5, :labname => "AV2")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 6, :labname => "AV3")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 7, :labname => "Statslab")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 8, :labname => "CCL")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 9, :labname => "Academic Labs")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 10, :labname => "Dorm Labs")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 11, :labname => "Burling 1st")
  end

def self.helpdesk
  	Lab.find_or_create_by_labname(:lab_id => 12, :labname => "Appdev")
  end

  
	def self.names(lab) 
		@@labnames[lab]
	end

	 def get_lab_shifts
    Shift.find(:all, :conditions => {:lab_id => self.lab_id})
  	end

  def order_by_starttime
  	get_lab_shifts.order_by([:starttime, :asc])
  end

end
