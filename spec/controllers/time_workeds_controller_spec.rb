require 'spec_helper'

describe TimeWorkedsController do

  describe "GET 'clock'" do

  	let(:tcc) { FactoryGirl.create(:tcc) }

  	before do
  		log_in tcc
  	end

    it "returns http success" do
      get 'clock'
      response.should be_success
    end
  end

end
