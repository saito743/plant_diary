class FollowsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.follow(params[:user_id])
		@user = User.find_by(id: params[:user_id])
		@following_users = @user.following_user
		@followed_users = @user.followed_user
	end

	def destroy
		@user = User.find_by(id: params[:user_id])
		@following_users = @user.following_user
		@followed_users = @user.followed_user
		current_user.unfollow(params[:user_id])
	end

	def follower
		user = User.find(params[:user_id])
		@following_users = user.following_user
	end

	def followed
		user = User.find(params[:user_id])
		@followed_users = user.followed_user
	end
private
	def follow_params
		params.require(:follow).permit(:followed_id, :follower_id)
	end
end
