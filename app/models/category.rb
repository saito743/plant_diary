class Category < ApplicationRecord
	has_many :plants

	enum name: { "初心者おすすめ": 0, "慣れてきた人おすすめ": 1, "上級者おすすめ": 2 }
end
