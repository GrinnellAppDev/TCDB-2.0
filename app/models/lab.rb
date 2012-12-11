class Lab < ActiveRecord::Base
      attr_accessible :lab_id, :labname
      has_many :shift_times
      has_many :lab_times


def get_lab_shifts
  Shift.find(:all, :conditions => {:lab_id => self.lab_id})
end

def order_by_starttime
  get_lab_shifts.order_by([:starttime, :asc])
end


#New stuff from them... 

def self.nolab
 Lab.find_or_create_by_labname(:lab_id => 0, :labname => "Nolab")
end

def self.helpdesk1
 Lab.find_or_create_by_labname(:lab_id => 1, :labname => "Helpdesk")
end

def self.helpdesk2
 Lab.find_or_create_by_labname(:lab_id => 2, :labname => "Helpdesk2")
end

def self.helpdesk3
 Lab.find_or_create_by_labname(:lab_id => 3, :labname => "Helpdesk3")
end

def self.av1
 Lab.find_or_create_by_labname(:lab_id => 4, :labname => "Av1")
end

def self.av2
 Lab.find_or_create_by_labname(:lab_id => 5, :labname => "Av2")
end

def self.av3
 Lab.find_or_create_by_labname(:lab_id => 6, :labname => "Av3")
end

def self.statslab
 Lab.find_or_create_by_labname(:lab_id => 7, :labname => "Statslab")
end

def self.ccl
 Lab.find_or_create_by_labname(:lab_id => 8, :labname => "CCL")
end

def self.acadlabs
 Lab.find_or_create_by_labname(:lab_id => 9, :labname => "Academic Labs")
end

def self.dormlabs
 Lab.find_or_create_by_labname(:lab_id => 10, :labname => "Dorm Labs")
end

def self.burling
 Lab.find_or_create_by_labname(:lab_id => 11, :labname => "Burling1st")
end

def self.appdev
 Lab.find_or_create_by_labname(:lab_id => 12, :labname => "Appdev")
end


def self.getlab(index)
  var =  [Lab.helpdesk1, Lab.helpdesk2, Lab.helpdesk3, Lab.av1, Lab.av2, Lab.av3, Lab.statslab, Lab.ccl, Lab.acadlabs,
    Lab.dormlabs, Lab.burling, Lab.appdev]
    return var[index]
  end  
  
  def self.names(lab) 
    @@labnames[lab]
  end
end
end
