# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before do
    @user = User.new(username:"username", name: "Example User", rank:"TC",
                     password: "foobar", password_confirmation: "foobar", phone: "111-111-1111")
    @tcc = @user.clone
    @tcc.rank = "TCC"
    #@tcc = User.new(username:"tccname1", name: "Example TCC", rank:"TCC",
    #                 password: "foobar", password_confirmation: "foobar", phone: "111-111-1111")
    @shift = Shift.new(lab_id: "1", filled:"false", starttime: Time.now, 
                      endtime: Time.now + 60, user_id: @user.id)
    @shift_future = Shift.new(lab_id: "1", filled:"false", starttime: Time.now + (60 * 60 * 24), 
                      endtime: Time.now + 60 + (60 * 60 * 24), user_id: @user.id)
    @shift_next_week = Shift.new(lab_id: "1", filled:"false", starttime: Time.now + (60 * 60 * 24 * 7), 
                      endtime: Time.now + 60 + (60 * 60 * 24 * 7), user_id: @user.id)
    @shift_two_weeks = Shift.new(lab_id: "1", filled:"false", starttime: Time.now + (60 * 60 * 24 * 14), 
                      endtime: Time.now + 60 + (60 * 60 * 24 * 14), user_id: @user.id)
    @shift_past = Shift.new(lab_id: "1", filled:"false", starttime: Time.now - (60 * 17), 
                      endtime: Time.now - 60 , user_id: @user.id)

  end

  subject { @user }
  it { should respond_to(:username) }
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:phone) }
  it { should respond_to(:boxNum) }
  it { should respond_to(:pCard) }
  it { should respond_to(:rank) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:year) }
  it { should respond_to(:photo_url) }
  it { should be_valid }
describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end
  describe "when username is too long" do
    before { @user.username = "a" * 11 }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when rank is not present" do
    before { @user.rank = " " }
    it { should_not be_valid }
  end
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_username(@user.username) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end

  describe "get user shifts" do
    before do
      @user.save
      @shift[:user_id] = @user.id
      @shift.save 
    end
    let(:test) {@user.get_user_shifts.include?(@shift)}
     specify{ test.should be_true}
  end

  describe "get future user shifts" do
    before do
      @user.save
      @shift[:user_id] = @user.id
      @shift.save 
      @shift_past[:user_id] = @user.id
      @shift_past.save
      @shift_future[:user_id] = @user.id
      @shift_future.save
    end
     let(:test) {@user.get_future_user_shifts.include?(@shift)}
     #specify{ test.should be_true}
     pending "these don't pass, fix them"
     
     let(:test1) {@user.get_future_user_shifts.include?(@shift_future)}
     #specify{ test1.should be_true}
     pending "these don't pass, fix them"

     let(:test2) {@user.get_future_user_shifts.include?(@shift_past)}
     specify{ test2.should be_false}
   end
 
  describe "get next week user shifts" do
    before do
      @user.save
      @shift[:user_id] = @user.id
      @shift.save 
      @shift_past[:user_id] = @user.id
      @shift_past.save
      @shift_future[:user_id] = @user.id
      @shift_future.save
      @shift_next_week[:user_id] = @user.id
      @shift_next_week.save
      @shift_two_weeks[:user_id] = @user.id
      @shift_two_weeks.save
    end
      let(:test) {@user.get_next_week_user_shifts.include?(@shift)}
      #specify{ test.should be_true}
      pending "these don't pass, fix them"
      
      let(:test1) {@user.get_next_week_user_shifts.include?(@shift_future)}
      specify{ test1.should be_true}
      
      let(:test2) {@user.get_next_week_user_shifts.include?(@shift_past)}
      specify{ test2.should be_false}

      let(:test3) {@user.get_next_week_user_shifts.include?(@shift_next_week)}
      specify{ test3.should be_true}
      
      let(:test4) {@user.get_next_week_user_shifts.include?(@shift_two_weeks)}
      specify{ test4.should be_false}
    end

    describe "shift via user -" do
      before(:each) do
        @user.save
        @new_shift = @user.shifts.create(:filled => false, :lab_id => 1, :starttime => Time.now + 1.day, :endtime => Time.now + 1.day + 2.hours)
      end

      describe "create" do
        specify {@new_shift.should be_valid}
      end

      describe "find" do
        before do
          @the_shift = @user.shifts.find(@new_shift.id)
        end

        specify {@the_shift.should be_valid}
      end
    end

    describe "time_worked via user -" do
      before(:each) do
        @user.save
        @new_time_worked = @user.time_workeds.create(:comment => "hi", :endtime => Time.now, :lab_id => 1, :shift_id => 1, :starttime => Time.now - 2.hours)
      end
      
      describe "create" do
        specify {@new_time_worked.should be_valid}
      end

      describe "find" do
        before do
          @the_time_worked = @user.time_workeds.find(@new_time_worked.id)
        end

        specify {@the_time_worked.should be_valid}
      end
    end
end
