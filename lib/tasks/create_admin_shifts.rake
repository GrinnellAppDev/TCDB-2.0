namespace :admin do 
	namespace :create do 
		desc "Create admin shifts"
		task :shifts => :environment do
		
		#Get reference to admin spelving
		spelving = User.find_by_username("spelving")

		# Make shifts
		# Future
		spelving.shifts.create(:filled => false, :lab_id => 1, :starttime => Time.now + 1.day, :endtime => Time.now + 1.day + 2.hours)

		# Over seven days
		spelving.shifts.create(:filled => false, :lab_id => 1, :starttime => Time.now + 8.day, :endtime => Time.now + 8.day + 2.hours)

		# Now
		spelving.shifts.create(:filled => false, :lab_id => 1, :starttime => Time.now, :endtime => Time.now + 2.hours)

		# In Past
		spelving.shifts.create(:filled => true, :lab_id => 1, :starttime => Time.now - 1.day, :endtime => Time.now - 1.day + 2.hours)
	end
end
end



