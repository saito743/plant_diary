class Comment < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	attachment :comment_image

end
