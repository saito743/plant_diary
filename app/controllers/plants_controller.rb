class PlantsController < ApplicationController
	def new
		@plant = Plant.new
	end

	def create
		@plant = Plant.new(plant_params)
		@plant.user_id = current_user.id
	 	@plant.category_auto
	 	@plant.categor_id_auto
		if 	@plant.save
			redirect_to plant_path(@plant)
		else
			render "new"
		end
	end

	def show
		@plant = Plant.find(params[:id])
	end

	def edit
		@plant = Plant.find(params[:id])
	end

	def update
		@plant = Plant.find(params[:id])
		if  @plant.update(plant_params)
			@plant.categor_id_auto_update
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
