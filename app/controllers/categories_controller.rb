class CategoriesController < ApplicationController
	def index
		if 	params[:category_id] <= 3.to_s &&  params[:category_id] >= 1.to_s
			ranking = Like.group(:plant_id).order('count(plant_id) desc').pluck(:plant_id)
			@plants = Plant.where(id: ranking, category_id: params[:category_id])
			@category = Category.find(params[:category_id])
			if 	params[:category_id] == 1.to_s
				@plant_1 = Plant.where(id: ranking, category_id: 2).order(created_at: "DESC").limit(3)
				@plant_2 = Plant.where(id: ranking, category_id: 3).order(created_at: "DESC").limit(3)
				@category_1 = Category.find_by(id: 2)
				@category_2 = Category.find_by(id: 3)
			elsif
				params[:category_id] == 2.to_s
				@plant_1 = Plant.where(id: ranking, category_id: 1).order(created_at: "DESC").limit(3)
				@plant_2 = Plant.where(id: ranking, category_id: 3).order(created_at: "DESC").limit(3)
				@category_1 = Category.find_by(id: 1)
				@category_2 = Category.find_by(id: 3)
			else
				params[:category_id] == 3.to_s
				@plant_1 = Plant.where(id: ranking, category_id: 1).order(created_at: "DESC").limit(3)
				@plant_2 = Plant.where(id: ranking, category_id: 2).order(created_at: "DESC").limit(3)
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
