require 'spec_helper'

describe Relationship do
  
    let (:resto) { FactoryGirl.create(:restaurant) }
    let (:person) { FactoryGirl.create(:user) }
    let (:relationship) { resto.relationships.build(user_id: person.id) }

    subject { relationship }

    it { should be_valid }

    describe 'follower methods' do
        it { should respond_to(:restaurant) }
        it { should respond_to(:user) }

        its (:restaurant) { should eq resto }
        its (:user) { should eq person}

    end

  describe "when restaurant id is not present" do
    before { relationship.restaurant_id = nil }
    it { should_not be_valid }
  end

  describe "when user id is not present" do
    before { relationship.user_id = nil }
    it { should_not be_valid }
  end

end
