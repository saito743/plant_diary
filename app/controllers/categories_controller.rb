class CategoriesController < ApplicationController
	def index
		if 	params[:category_id] <= 3.to_s &&  params[:category_id] >= 1.to_s
			@category = Category.find(params[:category_id])
			@plants = Plant.joins(:likes).group("likes.plant_id").where(category_id: params[:category_id]).order('count(plant_id) desc')
			if 	params[:category_id] == 1.to_s
				@plant_1 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 2).order('count(plant_id) desc').limit(3)
				@plant_2 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 3).order('count(plant_id) desc').limit(3)
				@category_1 = Category.find_by(id: 2)
				@category_2 = Category.find_by(id: 3)
			elsif
				params[:category_id] == 2.to_s
				@plant_1 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 1).order('count(plant_id) desc').limit(3)
				@plant_2 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 3).order('count(plant_id) desc').limit(3)
				@category_1 = Category.find_by(id: 1)
				@category_2 = Category.find_by(id: 3)
			else
				params[:category_id] == 3.to_s
				@plant_1 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 1).order('count(plant_id) desc').limit(3)
				@plant_2 = Plant.joins(:likes).group("likes.plant_id").where(category_id: 2).order('count(plant_id) desc').limit(3)
				@category_1 = Category.find_by(id: 1)
				@category_2 = Category.find_by(id: 2)
			end

		else
			redirect_to root_path
		end
	end
private
	def category_params
		params.require(:category).premit(:plant_id, :name)
	end
end
