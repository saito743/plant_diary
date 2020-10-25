class Plant < ApplicationRecord
	belongs_to :user
	belongs_to :category, optional: true
	has_many :tags, through: :tag_map
	has_many :trees
	has_many :comments
	has_many :likes

	attachment :image

	validates :name, length: { in: 2..20 }
	validates :body,length: { maximum:300 }
	#validates :difficulty, numercality: {
	#			greater_than_or_equal_to: 1,
	#			less_than_or_equal_to: 5},
	#			presence: true

	def category_auto #カテゴリの自動割り振り（新規投稿時）
		if  self.difficulty == "1" || self.difficulty == "2"
			self.category = Category.find_by(name: 0)
		elsif
			self.difficulty == "3" || self.difficulty == "4"
			self.category = Category.find_by(name: 1)
		else
			self.category = Category.find_by(name: 2)
		end
	end

	def category_auto_update #カテゴリの自動割り振り（更新時）
		if  self.difficulty == "1" || self.difficulty == "2"
			self.category.update(name: 0)
		elsif
			self.difficulty == "3" || self.difficulty == "4"
			self.category.update(name: 1)
		else
			self.category.update(name: 2)
		end
	end
end
