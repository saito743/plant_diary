class CommentsController < ApplicationController
	def create
		plant = Plant.find(params[:plant_id])
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		comment.plant_id = plant.id
		if  comment.save
			redirect_to request.referer
		else
			render plant_path(plant)
		end
	end

	def destroy
		Comment.find_by(id: params[:id],plant_id: params[:plant_id]).delete
		redirect_to request.referer
	end

private
	def comment_params
		params.require(:comment).permit(:body,:comment_image, :user_id, :pkant_id)
	end
end
