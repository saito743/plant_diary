module ApplicationHelper
	#退会済みユーザーかどうか
	def user_withdrawal(user)
		if user.is_deleted == true
			"退会済み"
		end
	end
	#treeの投稿があるかどうか（投稿の最終更新日の表記で使用）
	def update_history(plant)
		if plant.trees.empty? == true
			plant.updated_at.strftime("%Y/%m/%d")
		else
			plant.trees.last.updated_at.strftime("%Y/%m/%d")
		end
	end

	#編集したかどうか
	def edit_history(plant)
		if plant.created_at != plant.updated_at
			"（編集済み）"
		end
	end
end
