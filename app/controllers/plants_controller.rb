class PlantsController < ApplicationController
	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)
		@plant.user_id = current_user.id
		@plant.category_auto
		if 	@plant.save
			redirect_to plant_path(@plant)
		else
			render "new"
		end
	end

	def show
		@plant = Plant.find(params[:id])
		@tree = Tree.new
		@trees = Tree.where(plant_id: params[:id])
	end

	def edit
		@plant = Plant.find(params[:id])
	end

	def update
		@plant = Plant.find(params[:id])
		@plant.category = Category.find_by(id: @plant.category_id)
		if  @plant.update(plant_params)
			@plant.category_id_auto_update
			@plant.category_auto_update
			redirect_to plant_path(@plant)
		else
			render "edit"
		end
	end

	def delete
	end
private
	def plant_params
		params.require(:plant).permit(:name, :body, :plante, :difficulty, :image)
	end
end
