require 'spec_helper'

describe "CreateAllShiftsPages" do

   subject { page }

   let(:user) { FactoryGirl.create(:user) }
   before { log_in user }

   describe "updating shift times of labs" do
    before { visit prepsemester_path }

    it {should have_selector('h1', text:"Create All Shifts")}

    end

end
