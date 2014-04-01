require 'spec_helper'

describe "observations/new" do
  before(:each) do
    assign(:observation, stub_model(Observation,
      :line_size => 1
    ).as_new_record)
  end

  it "renders new observation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", observations_path, "post" do
      assert_select "input#observation_line_size[name=?]", "observation[line_size]"
    end
  end
end
