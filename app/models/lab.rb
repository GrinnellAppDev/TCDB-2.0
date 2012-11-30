module Lab

	@@labnames = { 
		nolab: 0,
		helpdesk: 1, 
        helpdesk2: 2,
        helpdesk3: 3,
        beanieteam: 4, 
        project: 5,
        av1: 6, 
        av2: 7,
        av3: 8,
        burling1: 9,
        stats: 10,
        tcc: 11,
        academicLabs: 12,
        dormLabs: 13,
        appdev: 14,
        ccl: 15
    }

	# @@labIDs =  { 
	# 	0: "No Lab",
	# 	1: 'Helpdesk',
 #        2: 'Helpdesk 2',
 #        3: 'Helpdesk 3',
 #        4: 'Beanie Team', 
 #        5: 'Project',
 #        6: 'AV Center 1', 
 #        7: 'AV Center 2', 
 #        8: 'AV Center 3', 
 #        9: 'Burling 1st',
 #        10: 'Stats Lab',
 #        11: 'TCC',
 #        12: 'Academic Labs',
 #        13: 'Dorm Labs',
 #        14: 'AppDev',
 #        15: 'CCL'
 #    }
    
	def self.names(lab) 
		@@labnames[lab]
	end
	def self.ids(index) 
		@@labIDs[index]
	end
end