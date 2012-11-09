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
                     password: "foobar", password_confirmation: "foobar")
    @tcc = User.new(username:"tccname1", name: "Example TCC", rank:"TCC",
                     password: "foobar", password_confirmation: "foobar")
    @shift = Shift.new(labid: "1", filled:"false", starttime: Time.now, 
                      endtime: Time.now + 60, userid: @user.id)
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
      @shift.save
      @user.save 
    end
    let(:test) {@user.get_user_shifts.include?(@shift)}
     specify{ test.should be_true}
  end

end