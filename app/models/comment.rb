class Comment < ApplicationRecord
	belongs_to :quote
	belongs_to :user

	validates_presence_of :content 
end
