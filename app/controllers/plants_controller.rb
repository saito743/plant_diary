class PlantsController < ApplicationController
	def index
		@plants = Plant.where(user_id: params[:user_id])
		@tag_list = Tag.all
	end

	def show
		@plant = Plant.find(params[:id])
		@plant_tags = @plant.tags
		@tree = Tree.new
		@comment = Comment.new
	end

before_action :authenticate_user!

	def new
		@plant = current_user.plants.new
	end

	def create
		@plant = current_user.plants.new(plant_params)
		@plant.category_auto #カテゴリ自動割り振り
		tag_list = params[:plant][:tag_name].split(nil)
		if 	@plant.save
			@plant.save_tag(tag_list)
			redirect_to plant_path(@plant)
		else
			render "new"
		end
	end

	def edit
		@plant = Plant.find(params[:id])
	end

	def update
		@plant = Plant.find(params[:id])
		@plant.category = Category.find_by(id: @plant.category_id)
		if  @plant.update(plant_params)
			@plant.category_id_auto_update	#カテゴリ自動割り振り
			@plant.category_auto_update 	#カテゴリID自動割り振り
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
