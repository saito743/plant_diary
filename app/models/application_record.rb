class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  #カテゴリページのサイドバー
  	def sideber(category1, category2)
		@plant_1 = Plant.where(category_id: category1).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
		@plant_2 = Plant.where(category_id: category2).sort {|a,b| b.like_ids.count <=> a.like_ids.count}
		@category_1 = Category.find_by(id: category1)
		@category_2 = Category.find_by(id: category2)
	end
end
