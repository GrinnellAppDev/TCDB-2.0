class LabTime < ActiveRecord::Base
  attr_accessible :close, :lab_id, :open, :day_of_week

  belongs_to :lab
  validates :lab_id, presence: true


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
end
