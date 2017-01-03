class CommentsController < ApplicationController
	before_action :find_quote
	before_action :find_comment
	before_action :authenticate_user!

	def create
		@comment = @quote.comments.build(comment_params.merge(user: current_user))
		@comment.user_id = current_user.id


		if @comment.save
			create_notification @quote
			respond_to do |format|
				format.html {redirect_to root_path}
				format.js
			end
		else
			flash[:alert]= "Can't add an empty comment!"
			render root_path
		end
	end

	def show
		@comment = @quote.comments.find_by_id(params[:id])
	end


	def destroy
		@comment = @quote.comments.find(params[:id])

		if @comment.user == current_user
			@comment.delete

			respond_to do |format|
				format.html {redirect_to root_path}
				format.js 
			end
		end	
	end
		
	private

	def create_notification(quote)
		return if quote.user == current_user
		Notification.create(user_id: quote.user.id,
							notified_by_id: current_user.id,
							quote_id: quote.id,
							identifier: @comment.id,
							notice_type: 'comment')

	end

	def comment_params
		params.require(:comment).permit(:content)
	end

	def find_quote
		@quote = Quote.find(params[:quote_id])
	end

	def find_comment
		@quote = Quote.find(params[:quote_id])
		@comment = @quote.comments.find_by_id(params[:id])
	end


end
