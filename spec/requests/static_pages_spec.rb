require 'spec_helper'

describe "Static Pages" do

	subject { page }

	describe "Directory Page" do
		let(:user) { FactoryGirl.create(:user) } #G
		let!(:user2) { FactoryGirl.create(:user2) } #S
		let!(:user3) { FactoryGirl.create(:user3) } #M

		before do
			log_in user
			visit directory_path
		end

		it { should have_selector('h1', text: "Directory") }

		it "should list each user" do
			User.all.each do |u|
				page.should have_selector('td', text: u.name)
			end
		end	

		 it "should list the users in the right order in table" do
		 	User.order("name asc").should == [user, user3, user2]
		 	User.order("name desc").should == [user2, user3, user]
		 	User.order("email asc").should == [user2, user3, user]
		 end
	end
end
