require 'spec_helper'

describe Shift do
  before {@shift = shift.new(starttime: Time.now, endtime: Time.now, labid: 5, filled: false)}

  subject{@shift}

  it {should respond_to(:starttime)}
  it {should respond_to(:endtime)}
  it {should respond_to(:labid)}
  it {should respond_to(:filled)}
end
