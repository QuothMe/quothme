require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
	
	
	 describe 'admins#create action' do
	 	admin = FactoryGirl.create(:admin)
	 	before(:each) do
	 		Devise.mailer.deliveries = []
	 		Admin.invite!({email: admin.email}, admin)
	 	end

	 	after(:each) do
	 		Devise.mailer.deliveries.clear
	 	end

  		it 'generates an invitation token' do
	 	expect(admin.invitation_token).to_not be_nil
	 	end

	 end
    
end
