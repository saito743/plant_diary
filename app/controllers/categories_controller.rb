class CategoriesController < ApplicationController
	def index
		if 	params[:category_id] <= 3.to_s &&  params[:category_id] >= 1.to_s
			@category = Category.find(params[:category_id])
			@plants = Plant.where(category_id: params[:category_id]).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
			#サイドバーのランキング
			if 	params[:category_id] == 1.to_s
				@plant_1 = Plant.where(category_id: 2).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
				@plant_2 = Plant.where(category_id: 3).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
				@category_1 = Category.find_by(id: 2)
				@category_2 = Category.find_by(id: 3)
			elsif
				params[:category_id] == 2.to_s
				@plant_1 = Plant.where(category_id: 1).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
				@plant_2 = Plant.where(category_id: 3).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
				@category_1 = Category.find_by(id: 1)
				@category_2 = Category.find_by(id: 3)
			else
				params[:category_id] == 3.to_s
				@plant_1 = Plant.where(category_id: 1).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
				@plant_2 = Plant.where(category_id: 2).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
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
