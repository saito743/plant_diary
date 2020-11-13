class FollowsController < ApplicationController
	before_action :authenticate_user!

	def create
		current_user.follow(params[:user_id])
		@user = User.find(params[:user_id])	#詳細ページのフォロワー数カウントで使用
		@user_follow = User.find_by(id: current_user.id)	#フォロー一覧ページで使用
		@following_users = @user_follow.following_user
		@followed_users = @user_follow.followed_user
	end

	def destroy
		current_user.unfollow(params[:user_id])
		@user = User.find(params[:user_id])
		@user_follow = User.find_by(id: current_user.id)
		@following_users = @user_follow.following_user
		@followed_users = @user_follow.followed_user
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
