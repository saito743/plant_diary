class Plant < ApplicationRecord
	belongs_to :user
	belongs_to :category, optional: true
	has_many :tags, through: :tag_map
	has_many :trees, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :image

	validates :name, length: { in: 2..20 }
	validates :body,length: { maximum:300 }
	validates :difficulty, numericality: {
				greater_than_or_equal_to: 1,
				less_than_or_equal_to: 5},
				presence: true

	def category_auto #カテゴリの自動割り振り（新規投稿時）
		if  self.difficulty == 1.to_s || self.difficulty == 2.to_s
			self.category = Category.find_by(name: 0)
		elsif
			self.difficulty == 3.to_s || self.difficulty == 4.to_s
			self.category = Category.find_by(name: 1)
		else
			self.category = Category.find_by(name: 2)
		end
	end

	def category_auto_update #カテゴリの自動割り振り（更新時）
		if  self.difficulty == 1.to_s || self.difficulty == 2.to_s
			self.update(category_id: 1.to_s)
			self.category.update(name: 0)
		elsif
			self.difficulty == 3.to_s || self.difficulty == 4.to_s
			self.category.update(name: 1)
			self.update(category_id: 2.to_s)
		else
			self.category.update(name: 2)
			self.update(category_id: 3.to_s)
		end
	end

	def category_id_auto_update #カテゴリIDの自動割り振り（更新時）
		if  self.difficulty == 1.to_s || self.difficulty == 2.to_s
			self.update(category_id: 1.to_s)
		elsif
			self.difficulty == 3.to_s || self.difficulty == 4.to_s
			self.update(category_id: 2.to_s)
		else
			self.update(category_id: 3.to_s)
		end
	end

	def like_by?(user)
		likes.where(user_id: user.id).exists?
	end
end
