class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :is_active])
	end
	#パスワード・メールアドレス編集後のリダイレクト先
	def after_sign_in_path_for(resource)
      user_path(resource)
	end
	#カテゴリのサイドバー
	def sideber(category1, category2)
		@plant_1 = Plant.where(category_id: category1).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
		@plant_2 = Plant.where(category_id: category2).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
		@category_1 = Category.find_by(id: category1)
		@category_2 = Category.find_by(id: category2)
	end
end