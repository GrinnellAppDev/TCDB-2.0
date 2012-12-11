# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Delete all the old stuff
LabTime.delete_all
ShiftTime.delete_all

# Delete all the old shifts. 
Shift.delete_all


# Create default lab times 

lab = Lab.find_by_labname("Av1")
startTimes = [Time.now.change(hour: 12), Time.now.change(hour: 7, min: 45), Time.now.change(hour: 7, min: 45), Time.now.change(hour: 7, min: 45), Time.now.change(hour: 7, min: 45), Time.now.change(hour: 7, min: 45), Time.now.change(hour: 10)]
endTimes = [Time.now.change(hour: 23, min: 59), Time.now.change(hour: 23, min: 59), Time.now.change(hour: 23, min: 59), Time.now.change(hour: 23, min: 59), Time.now.change(hour: 23, min: 59), Time.now.change(hour: 16), Time.now.change(hour: 18)]
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

lab = Lab.find_by_labname("Av2")
startTimes = [Time.now.change(hour: 0), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 0)]
endTimes = [Time.now.change(hour: 0), Time.now.change(hour: 23), Time.now.change(hour: 23), Time.now.change(hour: 23), Time.now.change(hour: 23), Time.now.change(hour: 17), Time.now.change(hour: 0)] 
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

lab = Lab.find_by_labname("Helpdesk")
startTimes = [Time.now.change(hour: 12), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 0)]
endTimes = [Time.now.change(hour: 22), Time.now.change(hour: 22), Time.now.change(hour: 22), Time.now.change(hour: 22), Time.now.change(hour: 22), Time.now.change(hour: 18), Time.now.change(hour: 0)]
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

lab = Lab.find_by_labname("Helpdesk2")
startTimes = [Time.now.change(hour: 12), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 9), Time.now.change(hour: 0)]
endTimes = [Time.now.change(hour: 21), Time.now.change(hour: 21), Time.now.change(hour: 21), Time.now.change(hour: 21), Time.now.change(hour: 21), Time.now.change(hour: 17), Time.now.change(hour: 0)]
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

lab = Lab.find_by_labname("Burling1st")
startTimes = [Time.now.change(hour: 13), Time.now.change(hour: 13), Time.now.change(hour: 13), Time.now.change(hour: 13), Time.now.change(hour: 13), Time.now.change(hour: 0), Time.now.change(hour: 13)]
endTimes = [Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 0), Time.now.change(hour: 19)]
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

lab = Lab.find_by_labname("Statslab")
startTimes = [Time.now.change(hour: 12), Time.now.change(hour: 18), Time.now.change(hour: 18), Time.now.change(hour: 18), Time.now.change(hour: 18), Time.now.change(hour: 0), Time.now.change(hour: 12)]
endTimes = [Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 24), Time.now.change(hour: 0), Time.now.change(hour: 18)]
7.times do |i|
	lt = lab.lab_times.build(open: startTimes[i], close: endTimes[i], lab_id: lab.lab_id, day_of_week: i)
	lt.save
end

#Create default shiftTimes. 


lab = Lab.find_by_labname("Av1")
startTimes = [Time.now.change(hour: 7, min: 45), Time.now.change(hour: 9), Time.now.change(hour: 10), Time.now.change(hour: 12), Time.now.change(hour: 14), Time.now.change(hour: 15), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 19), Time.now.change(hour: 20), Time.now.change(hour: 21), Time.now.change(hour: 22), Time.now.change(hour: 23)]
endTimes = [Time.now.change(hour: 9), Time.now.change(hour: 10), Time.now.change(hour: 12), Time.now.change(hour: 14), Time.now.change(hour: 15), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 19), Time.now.change(hour: 20), Time.now.change(hour: 21), Time.now.change(hour: 22), Time.now.change(hour: 23), Time.now.change(hour: 23, min: 59)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end

lab = Lab.find_by_labname("Av2")
startTimes = [Time.now.change(hour: 9), Time.now.change(hour: 11), Time.now.change(hour: 13), Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 18), Time.now.change(hour: 19), Time.now.change(hour: 20), Time.now.change(hour: 21)]
endTimes = [Time.now.change(hour: 11), Time.now.change(hour: 13), Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 18), Time.now.change(hour: 19), Time.now.change(hour: 20), Time.now.change(hour: 21), Time.now.change(hour: 23)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end

lab = Lab.find_by_labname("Helpdesk")
startTimes = [Time.now.change(hour: 9), Time.now.change(hour: 10), Time.now.change(hour: 12), Time.now.change(hour: 14), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 20)]
endTimes = [Time.now.change(hour: 10), Time.now.change(hour: 12), Time.now.change(hour: 14), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 20), Time.now.change(hour: 22)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end

lab = Lab.find_by_labname("Helpdesk2")
startTimes = [Time.now.change(hour: 9), Time.now.change(hour: 10), Time.now.change(hour: 11), Time.now.change(hour: 12), Time.now.change(hour: 13), Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 19)]
endTimes = [Time.now.change(hour: 10), Time.now.change(hour: 11), Time.now.change(hour: 12), Time.now.change(hour: 13), Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 19), Time.now.change(hour: 21)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end

lab = Lab.find_by_labname("Burling1st")
startTimes = [Time.now.change(hour: 13), Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 19), Time.now.change(hour: 21), Time.now.change(hour: 23)]
endTimes = [Time.now.change(hour: 15), Time.now.change(hour: 17), Time.now.change(hour: 19), Time.now.change(hour: 21), Time.now.change(hour: 23), Time.now.change(hour: 24)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end

lab = Lab.find_by_labname("Statslab")
startTimes = [Time.now.change(hour: 12), Time.now.change(hour: 14), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 20), Time.now.change(hour: 22)]
endTimes = [Time.now.change(hour: 14), Time.now.change(hour: 16), Time.now.change(hour: 18), Time.now.change(hour: 20), Time.now.change(hour: 22), Time.now.change(hour: 24)]
startTimes.count.times do |i|
	lt = lab.shift_times.build(start: startTimes[i], end: endTimes[i], lab_id: lab.lab_id)
	lt.save
end