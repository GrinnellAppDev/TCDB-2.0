require 'spec_helper'

describe Shift do
 
  # create temporary Shift instace @s
  before {@s = Shift.new(starttime: Time.now, endtime: Time.now + 60, lab_id: 5, filled: false)}
  
  # set subject to @s for 'it' reference
  subject{@s}

  # insure that method names exits
  it {should respond_to(:starttime)}
  it {should respond_to(:endtime)}
  it {should respond_to(:lab_id)}
  it {should respond_to(:filled)}
 

  # Insure @s is valid after initial creation
  describe "when shift has just been created" do
    it{should be_valid}
  end
  
  # Insure  test fails if certain values are nil that should not be
  describe "when start time is not present" do
    before { @s.starttime = nil }
    it {should_not be_valid}
  end

  describe "when end time is not present" do
    before {@s.endtime = nil}
    it {should_not be_valid}
  end

  describe "when lab_id is not present" do
    before {@s.lab_id = nil}
    it {should_not be_valid}
  end

  describe "when filled is not set" do
    before {@s.filled = nil}
    it {should_not be_valid}
  end

  # Test start time < End time
  describe "when start time is equal to end time" do
    before do
      @now = Time.now
      @s.starttime = @now
      @s.endtime = @now
    end
    
    it{should_not be_valid}
  end

  describe "when start time is greater than end time" do
    before do
      @now = Time.now 
      @s.starttime = @now + 60
      @s.endtime = @now
    end

    it{should_not be_valid}
  end

  # Insure after adding user_id value @s is still valid
  describe "when user_id is added" do
    before do
      @s.user_id = 23
    end

    it{should be_valid}
  end
  
end