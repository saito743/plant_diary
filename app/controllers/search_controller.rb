class SearchController < ApplicationController
	def search
		@content = params["search"]["content"]
		@records = search_for(@content)
	end
private
	def search_for(content)
		Plant.where('name LIKE ?', '%'+content+'%')
	end
end
