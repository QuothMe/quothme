require 'rails_helper'

RSpec.describe Quote, type: :model do
  it "is valid with valid attributes" do
    quote = Quote.new(citation: "words")
    expect(quote).to be_valid
  end
  it "should not valid without a citation" do
    quote = Quote.new(citation: nil)
    expect(quote).to_not be_valid
  end
end