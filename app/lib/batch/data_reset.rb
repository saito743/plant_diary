class Batch::DataReset
	def self.data_reset
		#seedで作成したデータ以外を全て削除
		User.where.not(id: 1..4).delete_all
		Plant.where.not(id: 1..9).delete_all
		Tag.where.not(id:1..9).delete_all
		TagMap.where.not(id:1..26).delete_all
		Tree.where.not(id:1..20).delete_all
		Like.where.not(id: 1..14).delete_all
		Follow.where.not(id: 1..8).delete_all
		Comment.where.not(id: 1..13).delete_all
	end
end
