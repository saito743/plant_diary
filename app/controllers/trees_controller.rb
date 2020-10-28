class TreesController < ApplicationController
	def create
		plant = Plant.find(params[:plant_id])
		tree = Tree.new(tree_params)
		tree.user_id = current_user.id
		tree.plant_id = plant.id
		if  tree.save
			redirect_to request.referer
		else
			render plant_path(plant)
		end
	end

	def edit
		@tree = Tree.find_by(id: params[:id], plant_id: params[:plant_id])
	end

	def update
		@tree = Tree.find_by(id: params[:id], plant_id: params[:plant_id])
		if  @tree.update(tree_params)
			redirect_to plant_path(@tree.plant)
		else
			render "edit"
		end
	end

	def destroy
		Tree.find_by(id: params[:id], plant_id: params[:plant_id]).destroy
		redirect_to request.referer
	end
private
	def tree_params
		params.require(:tree).permit(:title, :body, :image, :plant_id)
	end
end
