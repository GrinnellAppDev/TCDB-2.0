class ShiftTime < ActiveRecord::Base
	attr_accessible :end, :lab_id, :start
  validates :lab_id, presence: true

	belongs_to :lab


  #Creating defaults go here? 
  #With a line like this? lab.shift_times.build(start: 0, end: 0, lab_id: 2)
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
end
