require 'rails_helper'

RSpec.describe User, type: :model do
	it "is valid with valid attributes" do
		FactoryGirl.create(:user).should be_valid
	end


end
