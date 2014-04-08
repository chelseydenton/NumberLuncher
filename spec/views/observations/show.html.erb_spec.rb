require 'spec_helper'

describe "observations/show" do
  before(:each) do
    FactoryGirl.create(:restaurant) 
    @observation = assign(:observation, stub_model(Observation,
      :line_size => 1,
      :restaurant_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
