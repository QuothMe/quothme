require 'spec_helper'

FactoryGirl.define do 

	factory :quote do
		citation 'She said things'
		tag_list 'hello'
		image Rack::Test::UploadedFile.new(Rails.root + 'spec/fixtures/buscemi.png', 'image/jpg')
		user 
	end






	
end