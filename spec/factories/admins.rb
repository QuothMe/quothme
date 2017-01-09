require 'spec_helper'

FactoryGirl.define do


		factory :admin do
			first_name 'ahbabou'
			last_name 'bensaid'
			sequence :email do |n|
		      "dummyEmail#{n}@gmail.com"
		    end
			password 'password'

		end

end