require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "edit" do
    let(:tcc) { FactoryGirl.create(:tcc) }
    before do
          log_in tcc 
          visit edit_user_path(tcc.id)
      end

    describe "page" do
      it "should render edit page" do
        should have_selector('title', text: "Edit User")
        should have_selector('h1',    text: "Update") 
        should have_selector('h2',    text: tcc.name) 
      end
    end

    describe "with invalid information" do
      before { click_button "Save Changes" }

      it { should have_content('error') }
    end

    after { log_out }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

    before do 
      visit user_path(user) 
    end

    it { should_not have_selector('h1',    text: user.name) }
    it { should_not have_selector('title', text: user.name) }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

    before do 
      log_in(user)
      visit user_path(user) 
    end

    after { log_out }

    it { should have_selector('h2',    text: user.name) }
    it { should have_selector('title', text: user.name) }

  end

  describe "create page logged out" do
    let(:tcc) { FactoryGirl.create(:tcc)}

    before do 
      visit new_user_path 
    end

    describe "no user logged in" do
        it { should_not have_selector('h1',    text: 'Create') }
        it { should_not have_selector('title', text: 'Create') }
      end

    end

  describe "create page normal tc" do
    let(:user) { FactoryGirl.create(:user)}

    before do 
      log_in(user)
      visit new_user_path 
    end

    describe "not sufficient privelages" do
        it { should_not have_selector('h1',    text: 'Create') }
        it { should_not have_selector('title', text: 'Create') }
      end

    after { log_out }
    
    end

  describe "create page logged in" do
    let(:tcc) { FactoryGirl.create(:tcc)}

    before do 
      log_in tcc 
      visit new_user_path
    end

    describe "tcc logged in" do
      it { should have_selector('h1',    text: 'Create') }
      it { should have_selector('title', text: 'Create') }
    end
     
    let(:submit) { "Create User" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
        fill_in "Rank",         with: "TC"
        fill_in "Username",     with: "username"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end