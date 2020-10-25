class Plant < ApplicationRecord
	belongs_to :user
	#belongs_to :category
	has_many :tag_maps
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

end
