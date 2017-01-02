class CommentsController < ApplicationController

	def create
		@quote = Quote.find(params[:quote_id])
		@comment = @quote.comments.build(comment_params.merge(user: current_user))
		@comment.user_id = current_user.id


		if @comment.save
			create_notification @quote, @comment 
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
		@quote = Quote.find(params[:id])
		@comment = @quote.comments.find_by_id(params[:id])
	end


	def destroy
		@quote = Quote.find(params[:quote_id])
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

	def create_notification(quote, comment)
		return if quote.user.id == current_user.id
		Notification.create(user_id: quote.user.id,
							notified_by_id: current_user.id,
							quote_id: quote.id,
							comment_id: comment.id,
							notice_type: 'comment')

	end

	def comment_params
		params.require(:comment).permit(:content)
	end


end
