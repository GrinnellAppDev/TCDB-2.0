require 'scrape'
require 'spec_helper'

describe UserInfo do
  describe "when we scrape a user who has a nickname" do
    before { @amarrs = UserInfo::get_user_info('marrsale') }
    subject { @amarrs }
    it { should_not be_nil }
    it { should include(:name => "Alexander J (\"Alex\") Marrs",
                        :year => "2013",
                        :box => "3966",
                        :photo_url => "https://itwebapps.grinnell.edu/PcardImages/moved/26068.jpg")
    }
  end

  describe "when we scrape a user who does not have a nickname" do
    before { @dcow = UserInfo::get_user_info('cowdenda') }
    subject { @dcow }
    it { should_not be_nil }
    it { should include(:name => "David W Cowden",
                        :year => "2013",
                        :box => "3386",
                        :photo_url => "https://itwebapps.grinnell.edu/PcardImages/moved/52530.jpg")
    }
  end
end
