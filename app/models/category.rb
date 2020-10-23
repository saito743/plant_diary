class Category < ApplicationRecord
	has_many :plants, through: :difficulty
end
