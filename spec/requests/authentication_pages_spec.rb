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
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_link(user.name, href: "#") }

      describe "followed by checking directory page" do
        before { click_link "Directory" }
        it { should have_selector('h1', text: 'Directory') }

        it "should list each user" do
          User.all.each do |user|
            page.should have_selector('td', text: user.name)
          end
        end
      end

      describe "followed by logout" do
        before { click_link "Log out" }
        it { should have_selector('title', text: 'Log in')}
      end

      it { should have_selector('title', text: "TCDB") }
    end
  end
end