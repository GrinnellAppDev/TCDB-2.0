class Lab < ActiveRecord::Base
  attr_accessible :lab_id, :labname

  	@@labnames = { 
		nolab: 0,
		helpdesk: 1,
		helpdesk2: 2,
		av1: 3,
		av2: 4,
		buling1st: 5,
		av3: 6,
		staslab: 7,
		helpdesk3: 8,
		labs_academic: 9,
		labs_dorm: 10,
		ccl:11,
		appdev: 12
		 }

	def self.names(lab) 
		@@labnames[lab]
	end

	 def get_lab_shifts
    Shift.find(:all, :conditions => {:labid => self.id})
  	end

  def order_by_starttime
  	get_lab_shifts.order_by([:starttime, :asc])
  end
  
end
