class CommentsController < ApplicationController

	def create
		
		comment = Comment.new(comment_params)
		comment.event_id = params[:event_id]
		comment.user_id = current_user.id
		if comment.save
			redirect_to :back
			flash[:success] = ["Comment successfully created"]
		else
			flash[:errors] = event.errors.full_messages
			redirect_to :back
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end
end