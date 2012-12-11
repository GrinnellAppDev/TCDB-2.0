class LabTime < ActiveRecord::Base
  attr_accessible :close, :lab_id, :open, :day_of_week

  belongs_to :lab
  validates :lab_id, presence: true


end
