class CategoriesController < ApplicationController
	def index
		if  params[:category_id]
			@plants = Plant.where(category_id: params[:category_id])
		end
	end
private
	def category_params
		params.require(:category).premit(:plant_id, :name)
	end
end
