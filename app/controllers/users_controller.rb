class UsersController < ApplicationController
	def show
		@user = User.find_by(id: params[:id])
		@plants = Plant.where(user_id: params[:id]).order(created_at: "DESC").limit(2)
		user_like = @user.likes.pluck(:plant_id)
		@user_like_plants = Plant.where(id: user_like)
		users = @user.followed_user
		@followed_users_plant = Plant.where(user_id: users)
	end

before_action :authenticate_user!

	def edit
		@user = User.find(params[:id])
		if 	@user == current_user
      	  	render "edit"
    	else redirect_to user_path(current_user)
    	end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(current_user)
		else render "edit"
		end
	end

	def unsubscribe
		@user = User.find_by(params[:id])
	end

	def withdraw
		binding.pry
		@user = current_user
		@user.update(is_deleted: true)
		reset_session
    	redirect_to root_path
	end

private
	def user_params
	  params.require(:user).permit(:name,:introduction,:like_plant, :email, :image, :is_deleted)
	end
end
