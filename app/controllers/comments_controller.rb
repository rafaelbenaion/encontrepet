class CommentsController < ApplicationController
	def create
		@lost = Lost.find(params[:lost_id])
		@comment = @lost.comments.create(comment_params)
		@comment.user_id = current_user.id if current_user

		if @comment.save
			redirect_to lost_path(@lost)
		else
			redirect_to lost_path(@lost)
		end
	end

	def destroy
		@lost = Lost.find(params[:lost_id])
		@comment = @lost.comments.find(params[:id])
		@comment.destroy
		redirect_to lost_path(@lost)
	end

	private

    def comment_params
      params.require(:comment).permit(:comment)
    end

end
