class Plant < ApplicationRecord
	belongs_to :user
	belongs_to :category, optional: true

	has_many :tag_maps, dependent: :destroy
	has_many :tags, through: :tag_maps

	has_many :trees, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	attachment :image

	validates :name, presence: true,
					 length: { maximum:30 }
	validates :body, presence: true,
					 length: { maximum:800 }
	validates :plante, length: { maximum:30 }
	validates :difficulty, numericality: {
				greater_than_or_equal_to: 1,
				less_than_or_equal_to: 5}
	validates :image, presence: true

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

	def like_by?(user) #ブックマークに登録していればtrue
		likes.where(user_id: user.id).exists?
	end

	def save_tag(sent_tags)  #タグの保存
		current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?   	#保存されているタグを取り出す
			old_tags = current_tags - sent_tags		#重複しているタグ
			new_tags = sent_tags - current_tags		#新規で登録されたタグ

			old_tags.each do |old|
				self.tags.delete Tag.find_by(tag_name: old)	#古いタグを削除する（編集時に必要）
			end

			new_tags.each do |new|
				new_plant_tag = Tag.find_or_create_by(tag_name: new)	#新しいタグを保存
				self.tags << new_plant_tag
			end
	end
end
