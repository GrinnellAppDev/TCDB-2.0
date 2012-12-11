require 'spec_helper'
require 'capybara/rails'

describe "Schedule Page" do

 	subject { Capybara.page }


      describe "Generally" do

      	before do
      		Capybara.visit '/schedule'
      	end

      	it { should have_selector('title', text: "Schedule") }
        it { should have_selector('h2', text: "Please choose a Lab Name")}
        it { should have_selector('button', value: "Helpdesk")}
        it { should have_selector('button', value: "AV")}
        it { should have_selector('button', value: "Labs")}
        it { should have_selector('button', value: "Burling")}
        it { should have_selector('button', value: "Appdev")}

      end

end
