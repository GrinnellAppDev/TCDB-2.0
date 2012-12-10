require 'spec_helper'

describe ShiftTime do


  before do
    @lab = Lab.create(labname: "Helpdesk", lab_id: 1)
    @shift_time = @lab.shift_times.build(start:Time.now, end:Time.now + 60, lab_id: 6)
  end

  subject { @shift_time }

  it { should respond_to(:start) }
  it { should respond_to(:end) }
  it { should be_valid }
  its(:lab) { should == @lab }


  describe "when lab_id is not present" do
    before { @shift_time.lab_id = nil }
    it { should_not be_valid }
  end

end




