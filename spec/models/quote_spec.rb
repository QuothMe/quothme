require 'spec_helper'

RSpec.describe Quote do
  it "is valid with a citation" do
    FactoryGirl.create(:quote).should be_valid
  end

  it 'is invalid without a citation' do
  	FactoryGirl.build(:quote, citation: nil).should_not be_valid
  end
  it 'is invalid without a tag' do
  	FactoryGirl.build(:quote, tag_list: nil).should_not be_valid
  end

 
  
end