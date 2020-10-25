class CategoriesController < ApplicationController
	def index
		@categories = Category.where(id: params[:id])
	end
private
	def category_params
		params.require(:category).premit(:plant_id, :name)
	end
end
