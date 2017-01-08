require 'spec_helper'

FactoryGirl.define do 
	factory :user do
		sequence :email do |n|
			"email#{n}@email.com"
		end
		password 'password'
		password_confirmation 'password'

		first_name 'John'
		last_name 'Prettyman'
		username 'pretty666'

		factory :user_with_quotes do 
			transient do
				quotes_count 1
			end

			after(:create) do |user, evaluator|
				create_list(:quote, evaluator.quotes_count, user: user)

			end
		end

	end

end