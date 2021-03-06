class TreesController < ApplicationController
	def help
		@trees = Tree.where(ask_for_help: true)
	end

	def create
		@plant = Plant.find(params[:plant_id])
		@tree = Tree.new(tree_params)
		@tree.user_id = current_user.id
		@tree.plant_id = @plant.id
		@tree.save
	end

	def edit
		@tree = Tree.find_by(id: params[:id], plant_id: params[:plant_id])
	end

	def update
		@tree = Tree.find_by(id: params[:id], plant_id: params[:plant_id])
		if  @tree.update(tree_params)
			redirect_to plant_path(@tree.plant)
			flash[:notice] = "投稿が完了しました"
		else
			render "edit"
			flash.now[:alert] = "内容を再度確認してください"
		end
	end

	def destroy
		Tree.find_by(id: params[:id], plant_id: params[:plant_id]).destroy
		redirect_to request.referer
	end
private
	def tree_params
		params.require(:tree).permit(:title, :body, :image, :plant_id, :ask_for_help)
	end
end
