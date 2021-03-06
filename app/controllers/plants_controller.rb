class PlantsController < ApplicationController
	def index
		@plants = Plant.where(user_id: params[:user_id])
		@tag_list = Tag.all
	end

before_action :authenticate_user!

	def new
		@plant = current_user.plants.new
	end

	def create
		@plant = current_user.plants.new(plant_params)
		@plant.category_auto #カテゴリ自動割り振り
		tag_list = params[:plant][:tag_name].split(/[,|、]/) #タグ保存、読点は半角・全角どちらでも可
		if 	@plant.save
			@plant.save_tag(tag_list)
			redirect_to plant_path(@plant)
			flash[:notice] = "投稿が完了しました"
		else
			render "new"
			flash.now[:alert] = "内容を再度確認してください"
		end
	end

	def show
		@plant = Plant.find_by(id: params[:id])
		if @plant.nil?
			flash[:alert] = "削除されたか存在しない投稿です"
			return	redirect_to root_path
		end
		@plant_tags = @plant.tags
		@tree = Tree.new
		@comment = Comment.new
	end

	def edit
		@plant = Plant.find(params[:id])
		plant_tags = @plant.tags
		@tag_list = plant_tags.pluck(:tag_name).join(",")
    end


	def update
		@plant = Plant.find(params[:id])
		@plant.category = Category.find_by(id: @plant.category_id)
		tag_list = params[:plant][:tag_name].split(/[,|、]/) #タグ保存、読点は半角・全角どちらでも可
		if  @plant.update(plant_params)
			@plant.category_auto_update	#カテゴリ自動割り振り
			@plant.save_tag(tag_list)
			redirect_to plant_path(@plant)
			flash[:notice] = "編集内容を保存しました"
		else
			render "edit"
			flash.now[:alert] = "編集内容を再度確認してください"
		end
	end

	def destroy
		Plant.find(params[:id]).destroy
		@user = User.find_by(id: current_user.id)
		redirect_to user_path(@user)
	end
private
	def plant_params
		params.require(:plant).permit(:name, :body, :plante, :difficulty, :image)
	end
end
