class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@plants = Plant.where(user_id: params[:id]).order(created_at: "DESC").limit(2)
	end

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
private
	def user_params
	  params.require(:user).permit(:name,:introduction,:like_plant, :email, :image, :is_active)
	end
end
