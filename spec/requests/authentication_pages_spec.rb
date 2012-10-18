require 'spec_helper'



describe "Authentication" do

  subject { page }

  describe "log in page" do
    before { visit login_path }

    it { should have_selector('title', text: 'Log in') }
  end


  describe "log in" do
    before { visit login_path }

    describe "with invalid information" do
      before { click_button "Log in" }

      it { should have_selector('title', text: 'Log in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end


      it { should have_selector('title', text: user.name) }
 	  # it { should have_link('Log out', href: logout_path) }
    end
  end
end