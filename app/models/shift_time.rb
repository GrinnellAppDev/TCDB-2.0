class ShiftTime < ActiveRecord::Base
  attr_accessible :end, :lab_id, :start
  belongs_to :lab

  validates :lab_id, presence: true
end
