require 'spec_helper'

describe "observations/edit" do
  before(:each) do
    @observation = assign(:observation, stub_model(Observation,
      :line_size => 1
    ))
  end

  it "renders the edit observation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", observation_path(@observation), "post" do
      assert_select "input#observation_line_size[name=?]", "observation[line_size]"
    end
  end
end
