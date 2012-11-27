require 'spec_helper'

describe TimeWorked do
   # create temporary Shift instace @s
  before { @clocked_shift = TimeWorked.new( starttime: Time.now, endtime: Time.now + 60, lab_id: Lab.names(:helpdesk), userid: 1 ) }
  
  # set subject to @s for 'it' reference
  subject{ @clocked_shift }

  # insure that method names exits
  it {should respond_to(:starttime)}
  it {should respond_to(:endtime)}
  it {should respond_to(:lab_id)}
  it {should respond_to(:userid) }
  it {should respond_to(:payrate)}
  

  # Ensure time_worked is valid after initial creation
  describe "when shift has just been clocked" do
    it{should be_valid}
  end
  
  # Ensure  test fails if certain values are nil that should not be
  describe "when start time is not present" do
    before { subject.starttime = nil }
    it { should_not be_valid }
  end

  describe "when end time is not present" do
    before { subject.endtime = nil }
    it { should be_valid }
  end

  describe "when lab_id is not present" do
    before { subject.lab_id = nil }
    it { should_not be_valid }
  end

  describe "when userid is not set" do
    before { subject.userid = nil }
    it { should_not be_valid }
  end

  describe "payrate should have a default" do
  	it { subject.payrate.should == 8.50 }
  	it { should be_valid }
  end

  describe "when payrate is not present" do
    before { subject.payrate = nil }
    it { should_not be_valid }
  end

  describe "when payrate is present" do
    before { subject.payrate = 9.10 }
    it { should be_valid }
  end

  describe "when comment is not present" do
    before { subject.comment = nil }
    it { should be_valid }
  end

  describe "when comment is present" do
    before { subject.comment = "I love ponies!! <3" }
    it { should be_valid }
  end

  # Test start time < End time
  describe "when start time is equal to end time" do
    before do
      @now = Time.now
      subject.starttime = @now
      subject.endtime = @now
    end
    
    it{should_not be_valid}
  end

  describe "when start time is greater than end time" do
    before do
      @now = Time.now 
      subject.starttime = @now + 60
      subject.endtime = @now
    end

    it{should_not be_valid}
  end

  # Ensure after adding userid value @s is still valid
  describe "when userid is added" do
    before { subject.userid = 1 }
    it{should be_valid}
  end

  # Ensure after adding userid value @s is still valid
  describe "when userid is missing" do
    before { subject.userid = nil }
    it{should_not be_valid}
  end
 

end
