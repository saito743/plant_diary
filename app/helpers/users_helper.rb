module UsersHelper
	def user_comment_point(user)
		comment_point = Comment.where(user_id: params[:id]).pluck(:score)
		comment_count = comment_point.count
		if comment_count == 0
			average = 0
		else
			average = comment_point.sum % comment_count
		end
		if 	average == 0
			image_tag("comment_point_0.png")
		elsif
			average >= 0.1 && average <= 0.3
			image_tag("comment_point_01.png")
		elsif
			average >= 0.3 && average <= 0.5
			image_tag("comment_point_03.png")
		elsif
			average >= 0.5 && average <= 1
			image_tag("comment_point_05.png")
		elsif
			average == 1
			image_tag("comment_point_1.png")
		elsif
			average >= -0.1 && average <= -0.3
			image_tag("comment_point_-01.png")
		elsif
			average >= -0.3 && average <= -0.5
			image_tag("comment_point_-03.png")
		elsif
			average >= -0.5 && average <= -1
			image_tag("comment_point_-05.png")
		elsif
			average == -1
			image_tag("comment_point_-1.png")
		end
	end

	def index_user_comment_point(user)
		comment_point = Comment.where(user_id: user.id).pluck(:score)
		comment_count = comment_point.count
		if comment_count == 0
			average = 0
		else
			average = comment_point.sum % comment_count
		end
		if 	average == 0
			image_tag("comment_point_0.png")
		elsif
			average >= 0.1 && average <= 0.3
			image_tag("comment_point_01.png")
		elsif
			average >= 0.3 && average <= 0.5
			image_tag("comment_point_03.png")
		elsif
			average >= 0.5 && average <= 1
			image_tag("comment_point_05.png")
		elsif
			average == 1
			image_tag("comment_point_1.png")
		elsif
			average >= -0.1 && average <= -0.3
			image_tag("comment_point_-01.png")
		elsif
			average >= -0.3 && average <= -0.5
			image_tag("comment_point_-03.png")
		elsif
			average >= -0.5 && average <= -1
			image_tag("comment_point_-05.png")
		elsif
			average == -1
			image_tag("comment_point_-1.png")
		end
	end

	def user_coment_explanation(user)
		comment_point = Comment.where(user_id: params[:id]).pluck(:score)
		comment_count = comment_point.count
		if 	comment_count == 0
			average = 0
		else
		 	average = comment_point.sum % comment_count
		end
		user_coment_explanation = average
	end

	def index_user_coment_explanation(user)
		comment_point = Comment.where(user_id: user.id).pluck(:score)
		comment_count = comment_point.count
		if 	comment_count == 0
			average = 0
		else
		 	average = comment_point.sum % comment_count
		end
		user_coment_explanation = average
	end
end
