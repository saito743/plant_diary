class CategoriesController < ApplicationController
	def index
		if 	params[:category_id] <= 3.to_s &&  params[:category_id] >= 1.to_s
			@plants = Plant.where(category_id: params[:category_id])
			@category = Category.find(params[:category_id])
		else
			redirect_to root_path
		end
	end
private
	def category_params
		params.require(:category).premit(:plant_id, :name)
	end
end
