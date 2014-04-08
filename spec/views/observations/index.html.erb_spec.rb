require 'spec_helper'

describe "observations/index" do
  before(:each) do
    assign(:restaurant, 
      stub_model(Restaurant,
        :name => 'Chipotle'))
    assign(:observations, [
      stub_model(Observation,
        :line_size => 1,
        :restaurant_id => 1
      ),
      stub_model(Observation,
        :line_size => 1,
        :restaurant_id => 1
      )
    ])
  end

  it "renders a list of observations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
