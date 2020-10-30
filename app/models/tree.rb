class Tree < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	attachment :image
end
