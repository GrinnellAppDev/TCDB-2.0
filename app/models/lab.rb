module Lab

	@@labnames = { 
		nolab: 0,
		helpdesk: 1, 
		av: 2, 
		ccl: 3, 
		statslab: 4 }

	def self.names(lab) 
		@@labnames[lab]
	end
end