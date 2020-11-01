class LikesController < ApplicationController
	before_action :authenticate_user!

	def create
		@plant = Plant.find(params[:plant_id])
		like = Like.new(plant_id: @plant.id, user_id: current_user.id)
		like.save
	end

	def destroy
		@plant = Plant.find(params[:plant_id])
		like = Like.find_by(plant_id: @plant.id, user_id: current_user.id)
		like.destroy
	end
private
	def like_params
		params.require(:like).permit(:user_id, :plant_id)
	end
end
