require 'spec_helper'

describe Shift do
  
  before do
    @s = Shift.new(starttime: Time.now, endtime: Time.now, labid: 5, filled: false)
  end

  subject{@s}

  it {should respond_to(:starttime)}
  it {should respond_to(:endtime)}
  it {should respond_to(:labid)}
  it {should respond_to(:filled)}

  describe "when start time is not present" do
    before {@s.starttime = nil}
    it {should_not be_valid}
  end

  describe "when end time is not present" do
    before {@s.endtime = nil}
    it {should_not be_valid}
  end

  describe "when labid is not present" do
    before {@s.labid = nil}
    it {should_not be_valid}
  end

  describe "when filled is not set" do
    before {@s.filled = nil}
    it {should_not be_valid}
  end

  # Test start time < End time
  # Test that only up to minutes are stored

end
