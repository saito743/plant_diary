class Tag < ApplicationRecord
	has_many :plants through: :tag_map
end
