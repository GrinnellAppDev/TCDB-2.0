require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the TimeWorkedHelper. For example:
#
# describe TimeWorkedHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe TimeWorkedHelper do

  describe "clock_in user" do
  	
  	pending "when user is nil"

  	pending "when lab is nil"

  	pending "when mentoring is nil"

  	pending "after clock in user is clocked in"
  	pending "timeworked entry exists in database"
  	pending "@clocked_in_user is set"

  	pending "shift is linked if appropriate"



  end

  describe "clock_out user" do

  	pending "when user is nil"

  	pending "when mentoring is nil"
  	pending "when lab is not \"tcc\" and mentoring is true payrate should be 9.10"

  	pending "after clock_out user is clocked out"
  	pending "@clocked_in_user == nil"

  	pending "time_worked table entry is updated with the clock_out time"

  end

  describe "get_time_worked user" do

  	pending "when user is nil"

  	pending "returned time_worked entry is correct"
  	pending "clocked_in_user"

  end

  describe "clocked_in?" do

  	pending "true if current_user is clocked in"

  end

  describe "add_comment" do

  	pending "added comment is written to database"

  end

  describe "shift_assoc" do

  	pending "when shift is null"
  	pending "when time_worked is null"

  	pending "when shifts are linked"

  end

 
end
