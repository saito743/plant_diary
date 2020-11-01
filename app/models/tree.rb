class Tree < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	attachment :image

	validates :title,:body, :image_id, presence: true
	validates :title, length:{ maximum:30 }
	validates :body, length:{ maximum:200 }

end
