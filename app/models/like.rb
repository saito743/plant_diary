class Like < ApplicationRecord
	belongs_to :user
	belongs_to :plant

	validates :user_id, :plant_id, presence: true
end
