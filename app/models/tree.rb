class Tree < ApplicationRecord
	belongs_to :plant
	belongs_to :user

	attachment :image

	validates :title,:body, :image, presence: true
	validates :title, length:{ maximum:30 }
	validates :body, length:{ maximum:400 }

end
