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

end
