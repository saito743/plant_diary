class CategoriesController < ApplicationController
	def index
		params[:category_id]
		@plants = Plant.where(category_id: params[:category_id])
	end
private
	def category_params
		params.require(:category).premit(:plant_id, :name)
	end
end
