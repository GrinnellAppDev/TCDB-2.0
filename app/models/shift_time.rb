class ShiftTime < ActiveRecord::Base
	attr_accessible :end, :lab_id, :start
  validates :lab_id, presence: true

	belongs_to :lab

end
