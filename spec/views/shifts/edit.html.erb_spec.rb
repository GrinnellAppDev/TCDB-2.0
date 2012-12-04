require 'spec_helper'

describe "shifts/edit" do
  before(:each) do
    @shift = assign(:shift, stub_model(Shift,
      :filled => false,
      :lab_id => 1,
      :user_id => 1
    ))
  end

  it "renders the edit shift form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shifts_path(@shift), :method => "post" do
      assert_select "input#shift_filled", :name => "shift[filled]"
      assert_select "input#shift_lab_id", :name => "shift[lab_id]"
      assert_select "input#shift_user_id", :name => "shift[user_id]"
    end
  end
end
