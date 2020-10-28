class FollowsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.follow(params[:user_id])
		redirect_to request.referer
	end

	def destroy
		current_user.unfollow(params[:user_id])
		redirect_to request.referer
	end
private
	def follow_params
		params.require(:follow).permit(:followed_id, :follower_id)
	end
end
