require 'spec_helper'

describe Lab do
  
  before {@lab = Lab.new(lab_id: 1, labname: "Helpdesk" )}

   subject{@lab}
  
   it {should respond_to(:lab_id)}
   it {should respond_to(:labname)}
   it {should respond_to(:shift_times)}

   describe "when lab has just been created" do
    it{should be_valid}
  end
  
  # Insure  test fails if certain values are nil that should not be
  describe "when lab id is not present" do
    before { @lab.lab_id = nil }
    it {should_not be_valid}
  end

  describe "when lab name is not present" do
    before {@lab.labname = nil}
    it {should_not be_valid}
  end

end
