class Tree < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	belongs_to :help

	attachment :image

end
