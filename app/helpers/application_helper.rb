module ApplicationHelper
	#退会済みユーザーかどうか
	def user_withdrawal(user)
		if user.is_deleted == true
			"退会済み"
		end
	end
end
