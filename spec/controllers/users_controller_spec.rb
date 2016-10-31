require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "Should have an email field" do
    user = User.new(email: "hello@example.com", password:"12345678")
    expect(user).to be_valid

  end

end
