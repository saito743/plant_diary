class Comment < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	attachment :comment_image

	validates :body, presence: true,
					 length:{ maximum:150 }
end
