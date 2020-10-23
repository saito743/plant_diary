class UsersController < ApplicationController
	def show
		@user = User.where(id: params[:id])
		binding.pry
	end
private
	def user_params
	  params.require(:user).permit(:name,:introduction,:email,:image, :is_active)
	end
end
