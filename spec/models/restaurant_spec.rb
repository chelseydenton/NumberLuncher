require 'spec_helper'

describe Restaurant do

  #let (:restaurant) { FactoryGirl.create(:restaurant) }

  before do
    @restaurant = Restaurant.new(name: 'Chipotle', location: 'State Street')
  end
                                   
  subject { @restaurant }

  it { should respond_to(:name) }

  it { should respond_to(:observations) }

  it { should respond_to(:relationships) }


  it { should be_valid }

  describe 'when name is not present' do
    before { @restaurant.name = nil }
    it { should_not be_valid }
  end

  describe 'when location is not present' do
    before { @restaurant.location = nil }
    it { should_not be_valid }
  end

end
