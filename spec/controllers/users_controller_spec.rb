require 'spec_helper'

describe UsersController do
  include SessionsHelper
  describe "as an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before(:each) do
          sign_in admin
          visit users_path
        end

        it "should not be able to delete itself" do
      expect { delete :destroy, :id => admin }.not_to change(User, :count)
    end
    end

end