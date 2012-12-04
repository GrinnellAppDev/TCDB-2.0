class Lab < ActiveRecord::Base
  attr_accessible :lab_id, :labname

  validates(:lab_id, :presence => true)
  validates(:labname, :presence => true)

	nolab = Lab.find_or_create_by_labname(:lab_id => 0, :labname => "Nolab")
	helpdesk = Lab.find_or_create_by_labname(:lab_id => 1, :labname => "Helpdesk")
	helpdesk2 = Lab.find_or_create_by_labname(:lab_id => 2, :labname => "Helpdesk2")
	av1 = Lab.find_or_create_by_labname(:lab_id => 3, :labname => "Av1")
	av2 = Lab.find_or_create_by_labname(:lab_id => 4, :labname => "Av2")
	burling1st = Lab.find_or_create_by_labname(:lab_id => 5, :labname => "Burling1st")
	av3 = Lab.find_or_create_by_labname(:lab_id => 6, :labname => "Av3")
	staslab = Lab.find_or_create_by_labname(:lab_id => 7, :labname => "Staslab")
	helpdesk3 = Lab.find_or_create_by_labname(:lab_id => 8, :labname => "Helpdesk3")
	labs_academic = Lab.find_or_create_by_labname(:lab_id => 9, :labname => "Labs_academic")
	labs_dorm = Lab.find_or_create_by_labname(:lab_id => 10, :labname => "Labs_dorm")
	ccl = Lab.find_or_create_by_labname(:lab_id => 11, :labname => "Ccl")
	appdev = Lab.find_or_create_by_labname(:lab_id => 12, :labname => "Appdev")

  
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
