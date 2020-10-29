class TagsController < ApplicationController
	def index
		params[:tag_id]
		@tag = Tag.find_by(id: params[:tag_id])
	end
end
