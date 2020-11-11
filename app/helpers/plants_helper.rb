module PlantsHelper
	#raty　編集時に元データを出力、新規登録時はデフォルトの１を指示
	def star_edit(plant)
		if @plant.difficulty.nil? == false
			@plant.difficulty
		else
			1
		end
	end
end
