require 'rails_helper'

RSpec.describe AdminsController, type: :controller do
	describe 'current_admin is present'do
	
	it 'has a current_admin' do
	#expect(subject.current_admin).to_not eq(nil)
	end
end
	
	# describe 'admins#create action' do
	# 	login_admin
	# 	before(:each) do
	# 		Devise.mailer.deliveries = []
	# 		Admin.invite!({email: admin.email}, admin)
	# 	end

	# 	after(:each) do
	# 		Devise.mailer.deliveries.clear
	# 	end

 # 		it 'generates an invitation token' do
	# 	expect(admin.invitation_token).to_not be_nil
	# 	end

	# 	it 'sends an email' do
	# 		expect(Devise.mailer.deliveries.count).to eq(1)
	# 	end
	# end
    
end
