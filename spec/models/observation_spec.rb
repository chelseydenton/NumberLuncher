require 'spec_helper'

describe Observation do
  
  let (:user) { FactoryGirl.create(:user) }
  let (:restaurant) { FactoryGirl.create(:restaurant) }

  before { @observation = user.observations.build(line_size: 10, restaurant_id: restaurant.id, date_time: Time.now) }

  subject { @observation }

  it { should respond_to(:line_size) }
  it { should respond_to(:user) }
  it { should respond_to(:restaurant) }
  its(:user) { should eq user }
  its(:restaurant) { should eq restaurant }

  it { should be_valid }

  describe 'when user_id is not present' do
    before { @observation.user_id = nil }
    it { should_not be_valid }
  end

  describe 'when restaurant_id is not present' do
    before { @observation.restaurant_id = nil }
    it { should_not be_valid }
  end

  describe 'with blank line_size' do
    before { @observation.line_size = " " }
    it { should_not be_valid }
  end 

  describe 'with a negative line_size' do
    before { @observation.line_size = -1 }
    it { should_not be_valid }
  end

  describe 'with a zero line_size' do
    before { @observation.line_size = 0 }
    it { should be_valid }
  end

end
