class Plant < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :help, through: :tree

	has_many :tag_maps
	has_many :tags, through: :tag_map
	has_many :trees
	has_many :comments
	has_many :likes
end
