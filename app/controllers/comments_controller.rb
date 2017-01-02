class CommentsController < ApplicationController

	def create
		@quote = Quote.find(params[:quote_id])
		@comment = @quote.comments.build(comment_params.merge(user: current_user))
		@comment.user_id = current_user.id


		if @comment.save 
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

	def comment_params
		params.require(:comment).permit(:content)
	end


end
