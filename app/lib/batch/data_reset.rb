class Batch::DataReset
	def self.data_reset
		#seedで作成したデータ以外を全て削除
		#(tree・tag・tagmapはplantが削除されると同時に消えるので記載なし)
		User.where.not(id: 1..4).delete_all
		Plant.where.not(id: 1..9).delete_all
		Like.where.not(id: 1..6).delete_all
		Follow.where.not(id: 1..4).delete_all
		Comment.where.not(id: 1..13).delete_all
	end
end