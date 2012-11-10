require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "edit" do


describe "not logged in, accessing edit page" do
        let(:user) { FactoryGirl.create(:user) }

    before { visit edit_user_path(user.id) }

      describe "should not render edit page" do
        it { should_not have_selector('title', text: "Edit User") }
        it { should_not have_selector('h1',    text: "Update") }
        it { should_not have_selector('h2',    text: user.name) }
        it { should have_selector('title', text: "Log in") }
        it { should have_selector('h1',    text: "Log in") }
      end
    end

    describe "TC accesses their edit page" do
      #SHOULD SWITCH TO should WHEN USERS ARE GIVEN PERMISSION TO ACCESS THEIR OWN EDIT PAGE
      let(:user) { FactoryGirl.create(:user) }
      before do
        log_in user
        visit edit_user_path(user.id)
      end
      describe "not sufficient privelages" do
        it { should_not have_selector('title', text: "Edit User") }
        it { should_not have_selector('h1',    text: "Update") }
        it { should_not have_selector('h2',    text: user.name) }
      end
      after {log_out}
    end

describe "View edit page as TCC" do
      let(:tcc) { FactoryGirl.create(:tcc) }

    before do
          log_in tcc 
          visit edit_user_path(tcc.id)
      end

      describe "should render edit page" do
        it { should have_selector('title', text: "Edit User") }
        it { should have_selector('h1',    text: "Update") }
        it { should have_selector('h2',    text: tcc.name) }
      end
    after { log_out }
  end

end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

describe "View profile page before login" do
    before do 
      visit user_path(user) 
    end
    describe "not sufficient privelages" do

    it { should_not have_selector('h1',    text: user.name) }
    it { should_not have_selector('title', text: user.name) }
  end
  end

describe "View profile page after login" do
    before do 
      log_in(user)
      visit user_path(user) 
    end
    describe "sufficient privelages" do
    it { should have_selector('h2',    text: user.name) }
    it { should have_selector('title', text: user.name) }
end
    after { log_out }
end
end
  describe "create page logged out" do

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
        fill_in "Username",     with: "username"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end