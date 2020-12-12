class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		@plant = Plant.find(params[:plant_id])
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.plant_id = @plant.id
		@comment.score = Language.get_data(comment_params[:body])
		@comment.save
	end

	def destroy
		Comment.find_by(id: params[:id],plant_id: params[:plant_id]).delete
		@plant = Plant.find(params[:plant_id])
	end

private
	def comment_params
		params.require(:comment).permit(:body,:comment_image, :user_id, :pkant_id)
	end
end
