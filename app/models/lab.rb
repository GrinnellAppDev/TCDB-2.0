class Lab

def initialize

	@@names = { helpdesk: 1, 
			av: 2, 
			ccl: 3, 
			statslab: 4 }
	end
	def names(lab)
		@@names[lab]
	end
end
